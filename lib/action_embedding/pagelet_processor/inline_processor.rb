module ActionEmbedding
  class PageletProcessor
    class InlineProcessor
      def initialize(path, opts = {})
        @path = path
        @opts = opts
      end
      
      def process
        if ActionController::Routing::Routes.respond_to?(:call)
          # Rails 2.3 version
          response = ActionController::Routing::Routes.call(rack_env)[2]
        else
          # Rails 2.2 version
          request = EmbeddedRequest.new(rack_env)
          response = EmbeddedResponse.new
          
          controller = ActionController::Routing::Routes.recognize(request)
          controller.process(request, response)
        end

        follow_redirect_or_return_body(response)
      end
      
      private

      def follow_redirect_or_return_body(response)
        if response.status.to_s.first == '3' && response.location
          # This will obviously not work if we redirect to somewhere
          # outside our app, but in that case we should not be using
          # the inline method.
          @path = response.location.sub(/https?:\/\/[^\/]+/, '')
          process
        else
          response.body
        end
      end
      
      def rack_env
        # See http://rack.rubyforge.org/doc/SPEC.html for what needs to
        # go into a Rack environment hash.
        path_info, query_string = @path.split('?')
        env = {
          'REQUEST_METHOD' => 'GET',
          'SCRIPT_NAME' => '',
          'PATH_INFO' => path_info,
          'QUERY_STRING' => query_string || '',
          'SERVER_NAME' => 'www.example.com',
          'SERVER_PORT' => 80,
          'rack.version' => [1, 1],
          'rack.url_scheme' => 'http',
          'rack.input' => '',
          'rack.errors' => $stderr,
          'rack.multithread' => false,
          'rack.multiprocess' => false,
          'rack.run_once' => false,
          'rack.session' => @opts[:inline_session] || {},
          'HTTP_COOKIE' => @opts[:inline_cookie]
        }
        
        env['HTTP_X_REQUESTED_WITH'] = 'XMLHttpRequest' if @opts[:send_xhr_header]
        
        env
      end
    end
  end
end
