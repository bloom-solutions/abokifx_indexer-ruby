require 'spec_helper'

module AbokiFXIndexer
  RSpec.describe GetLatestNGNRatesParser do

    describe ".parse" do
      let(:response_body) do
        File.read(FIXTURES_DIR.join("sample_abokifx_page.html"))
      end

      it "parses 3 currencies" do
        parser = described_class.new(response_body: response_body)
        rates = parser.parse

        usd_rate = rates.find {|rate| rate.counter_currency == "USD" }
        expect(usd_rate.buy_rate).to eq 385.0
        expect(usd_rate.sell_rate).to eq 391.0

        gbp_rate = rates.find {|rate| rate.counter_currency == "GBP" }
        expect(gbp_rate.buy_rate).to eq 490.0
        expect(gbp_rate.sell_rate).to eq 498.0

        eur_rate = rates.find {|rate| rate.counter_currency == "EUR" }
        expect(eur_rate.buy_rate).to eq 415.0
        expect(eur_rate.sell_rate).to eq 420.0
      end

    end

  end
end
