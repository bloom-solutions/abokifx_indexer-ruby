require "spec_helper"

describe AbokiFXIndexer do
  it "has a version number" do
    expect(AbokiFXIndexer::VERSION).not_to be nil
  end

  it "is configurable" do
    described_class.configure do |c|
      c.base_url = "https://abokifx.com"
    end

    config = described_class.configuration
    expect(config.base_url).to eq "https://abokifx.com"
  end

  describe ".new" do
    it "initializes a AbokiFXIndexer::Indexer" do
      indexer = described_class.new(base_url: "https://abc.com")
      expect(indexer).to be_a described_class::Indexer
      expect(indexer.base_url).to eq "https://abc.com"

      AbokiFXIndexer.configure { |c| c.base_url = "http://xyz.com" }
      indexer = described_class.new
      expect(indexer).to be_a described_class::Indexer
      expect(indexer.base_url).to eq "http://xyz.com"
    end
  end


end

