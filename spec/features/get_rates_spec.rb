require 'spec_helper'

RSpec.describe "Get Parallel Market Rates", vcr: { record: :once } do

  it "gets rates from AbokiFX" do
    indexer = AbokiFXIndexer.new
    rates = indexer.get_latest_ngn_rates

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

