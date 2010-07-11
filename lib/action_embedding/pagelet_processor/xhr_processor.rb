module ActionEmbedding
  class PageletProcessor
    class XhrProcessor
      def initialize(path, opts = {})
        @path = path
        @opts = opts
      end

      def process
        return <<-EOF
<div class="xhr-replace" xhr-href="#{@path}">
<p>Loading...</p>
</div>
EOF
      end
    end
  end
end
