module ActionEmbedding
  class PageletProcessor
    def initialize(path, opts = {})
      @path = path
      @opts = opts
    end

    def process
      InlineProcessor.new(@path, @opts).process
    end
  end
end
