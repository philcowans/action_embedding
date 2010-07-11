require "open-uri"

module ActionEmbedding
  class PageletProcessor
    class ProxyProcessor
      def initialize(path, opts = {})
        @path = path
        @opts = opts
      end

      def process
        body = ''

        open(proxy_url) do |backend|
          body = backend.read
        end
        
        body
      end

      private

      def proxy_url
        ["http://", @opts[:proxy_host], @opts[:proxy_prefix], @path].join('')
      end
    end
  end
end
