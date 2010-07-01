module ActionEmbedding
  module Helpers
    def embed_pagelet(path, opts = {})
      PageletProcessor.new(path, opts).process
    end
  end
end
