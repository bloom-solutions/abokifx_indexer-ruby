require "spec_helper"

module AbokiFXIndexer
  RSpec.describe CurrencyPair, type: %i[virtus] do

    it "inherits from BaseModel" do
      expect(described_class < BaseModel).to be true
    end

    describe "attributes" do
      subject do
        described_class.new({
          base_currency: "NGN",
          counter_currency: "USD",
          buy_rate: 385,
          sell_rate: 390,
          read_on: Date.new(2017, 04, 27),
        })
      end
      it { is_expected.to have_attribute(:base_currency, String) }
      it { is_expected.to have_attribute(:counter_currency, String) }
      it { is_expected.to have_attribute(:buy_rate, Float) }
      it { is_expected.to have_attribute(:sell_rate, Float) }
      it { is_expected.to have_attribute(:post_date, Date) }
      it { is_expected.to have_attribute(:fetched_at, DateTime) }
    end
  end
end

