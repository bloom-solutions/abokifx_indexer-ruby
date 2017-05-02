module AbokiFXIndexer
  class Indexer
    include Virtus.model

    attribute :base_url, String, default: "https://abokifx.com"

  end
end
