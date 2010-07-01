module ActionEmbedding
  module Helpers
    def embed_pagelet(path)
      PageletProcessor.new(path).process
    end
  end
end
