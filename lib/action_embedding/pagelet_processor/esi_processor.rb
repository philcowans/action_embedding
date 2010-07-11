module ActionEmbedding
  class PageletProcessor
    class EsiProcessor
      def initialize(path, opts = {})
        @path = path
        @opts = opts
      end

      def process
        return <<-EOF
<esi:include src="#{@path}"/>
EOF
      end
    end
  end
end
