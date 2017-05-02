module AbokiFXIndexer
  class CurrencyPair < BaseModel

    attribute :base_currency, String
    attribute :counter_currency, String
    attribute :buy_rate, Float
    attribute :sell_rate, Float
    attribute :post_date, DateTime

  end
end
