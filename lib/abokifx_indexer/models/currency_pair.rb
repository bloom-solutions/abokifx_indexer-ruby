module AbokiFXIndexer
  class CurrencyPair < BaseModel

    attribute :base_currency, String
    attribute :counter_currency, String
    attribute :buy_rate, Float
    attribute :sell_rate, Float
    attribute :post_date, Date
    attribute :fetched_at, DateTime, default: DateTime.now

  end
end
