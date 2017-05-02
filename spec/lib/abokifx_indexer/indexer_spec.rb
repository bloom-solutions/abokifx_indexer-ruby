require "spec_helper"

module AbokiFXIndexer
  describe Indexer, type: %i[virtus] do
    describe "attributes" do
      subject { described_class.new }
      it { is_expected.to have_attribute(:base_url, String) }
    end

  end

end
