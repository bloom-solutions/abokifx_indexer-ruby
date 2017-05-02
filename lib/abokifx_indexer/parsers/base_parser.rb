module AbokiFXIndexer
  class BaseParser
    include Virtus.model

    attribute :response_body, Typhoeus::Response

  end
end
