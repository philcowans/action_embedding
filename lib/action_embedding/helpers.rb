module ActionEmbedding
  module Helpers
    def embed_pagelet(path)
      PageletProcessor.new(path, session, request.env).process
    end
  end
end
