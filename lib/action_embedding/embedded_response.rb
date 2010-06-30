module ActionEmbedding
  class EmbeddedResponse < ActionController::AbstractResponse
    def out(output = $stdout, &block)
      @body
    end
  end
end
