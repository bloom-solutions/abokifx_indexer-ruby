module AbokiFXIndexer
  class CurrencyPair < BaseModel

    attribute :base_currency, String
    attribute :counter_currency, String
    attribute :buy_rate, BigDecimal
    attribute :sell_rate, BigDecimal
    attribute :post_date, Date
    attribute :fetched_at, DateTime, default: DateTime.now

  end
end
