module ActionEmbedding
  class PageletProcessor
    def initialize(path, session, env)
      @path = path
      @session = session.dup
      @env = env.dup
    end

    def process
      request = EmbeddedRequest.new(@path, @session, @env)
      response = EmbeddedResponse.new
      Dispatcher.new($stdout, request, response).dispatch_unlocked
    end
  end
end
