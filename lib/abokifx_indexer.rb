require "active_support/core_ext/date"

require "gem_config"
require "nokogiri"
require "typhoeus"
require "virtus"

require "abokifx_indexer/version"
require "abokifx_indexer/indexer"
require "abokifx_indexer/models/base_model"
require "abokifx_indexer/models/currency_pair"
require "abokifx_indexer/parsers/base_parser"
require "abokifx_indexer/parsers/get_latest_ngn_rates_parser"

module AbokiFXIndexer
  include GemConfig::Base

  GLOBAL_OPTS = %i[base_url]

  with_configuration do
    has :base_url, classes: String, default: "https://abokifx.com"
  end

  def self.new(opts={})
    Indexer.new(global_opts.merge(opts))
  end

  private

  def self.global_opts
    GLOBAL_OPTS.each_with_object({}) do |var, hash|
      hash[var] = AbokiFXIndexer.configuration.send(var)
    end
  end

end
