class FakeRequest < ActionController::AbstractRequest
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

class FakeResponse < ActionController::AbstractResponse
  def out(output = $stdout, &block)
    @body
  end
end

 def embed_subpage(path)
    new_request = FakeRequest.new(path, session.dup, request.env.dup)
    new_response = FakeResponse.new

    new_output = $stdout

    Dispatcher.new(new_output, new_request, new_response).dispatch_unlocked
  end

