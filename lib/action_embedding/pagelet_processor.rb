module ActionEmbedding
  class PageletProcessor
    def initialize(path, opts = {})
      @path = path
      @opts = opts

      @opts[:method] ||= :inline
    end

    def process
      processor_klass = "ActionEmbedding::PageletProcessor::#{@opts[:method].to_s.camelize}Processor".constantize
      processor_klass.new(@path, @opts).process
    end
  end
end
