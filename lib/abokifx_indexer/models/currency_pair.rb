module AbokiFXIndexer
  class CurrencyPair < BaseModel

    attribute :base_currency, String
    attribute :counter_currency, String
    attribute :buy_rate, Float
    attribute :sell_rate, Float
    attribute :read_on, DateTime, default: :default_date

    private

    def default_date
      DateTime.now
    end

  end
end
