%w[ embedded_request
    embedded_response
    helpers
    pagelet_processor 
].each do |file|
  require File.dirname(__FILE__) + '/action_embedding/' + file
end
