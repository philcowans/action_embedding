module ActionEmbedding
  class PageletProcessor
    def initialize(path)
      @path = path
    end

    def process
      request = EmbeddedRequest.new(rack_env)
      response = EmbeddedResponse.new

      controller = ActionController::Routing::Routes.recognize(request)
      controller.process(request, response)
      
      response.body
    end

    private

    def rack_env
      # See http://rack.rubyforge.org/doc/SPEC.html for what needs to
      # go into a Rack environment hash.
      {
        'REQUEST_METHOD' => 'GET',
        'SCRIPT_NAME' => '',
        'PATH_INFO' => @path,
        'QUERY_STRING' => '',
        'SERVER_NAME' => 'www.example.com',
        'SERVER_PORT' => 80,
        'rack.version' => [1, 1],
        'rack.url_scheme' => 'http',
        'rack.input' => '',
        'rack.errors' => $stderr,
        'rack.multithread' => false,
        'rack.multiprocess' => false,
        'rack.run_once' => false
      }
    end
  end
end
