module ActionEmbedding
  class EmbeddedRequest < ActionController::AbstractRequest
    attr_reader :path
    attr_accessor :path_parameters
    attr_accessor :session_options
    attr_accessor :session
    attr_accessor :cookies
    
    def initialize(path, session, env)
      @path = path
      @session = session
      @env = env
      @cookies = {}
      super()
    end
    
    def method
      :get
    end
    
    def content_length
      0
    end
    
    def query_string
      ""
    end
    
    def user_agent
      "Internal fake request agent"
    end
  end
end
