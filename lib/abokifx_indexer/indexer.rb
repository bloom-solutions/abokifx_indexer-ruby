module AbokiFXIndexer
  class Indexer
    include Virtus.model

    attribute :base_url, String, default: "https://abokifx.com"

    def get_latest_ngn_rates
      response = Typhoeus.get(base_url)
      GetLatestNGNRatesParser.new(
        response_body: response.body,
      ).parse
    end
  end
end

