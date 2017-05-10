module AbokiFXIndexer
  class GetLatestNGNRatesParser < BaseParser

    def parse
      doc = Nokogiri::HTML(response_body)
      rates_container = doc.css(base_target_css_classes)
      latest_row = rates_container.search("tr.table-line").first
      post_date = latest_row.search("td")[0].text

      %w(USD GBP EUR).map do |currency|
        buy_sell_rate = parse_buy_sell_rate(currency, latest_row)

        CurrencyPair.new(
          base_currency: "NGN",
          counter_currency: currency,
          buy_rate: 1.0 / buy_sell_rate[:buy_rate],
          sell_rate: 1.0 / buy_sell_rate[:sell_rate],
          post_date: Date.strptime(post_date, "%d/%m/%Y"),
        )
      end
    end

    private

    def parse_buy_sell_rate(currency, latest_row)
      rates = case currency
              when "USD"
                latest_row.search("td")[1].text
              when "GBP"
                latest_row.search("td")[2].text
              when "EUR"
                latest_row.search("td")[3].text
              end
      {
        buy_rate: BigDecimal.new(rates.split("/")[0]),
        sell_rate: BigDecimal.new(rates.split("/")[1]),
      }
    end

    def base_target_css_classes
      [
        ".lagos-market-rates",
        ".lagos-market-rates-inner",
        ".lagos-inner-holder",
        "table.grid-table",
      ].join(" ")
    end

  end
end
