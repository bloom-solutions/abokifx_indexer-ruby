require "pry"
require "rspec"
require "virtus/matchers/rspec"
require "timecop"
require "pathname"
require "bundler/setup"
require "abokifx_indexer"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

SPEC_DIR = Pathname.new(File.dirname(__FILE__))
FIXTURES_DIR = SPEC_DIR.join("fixtures")
Dir[SPEC_DIR.join("support", "*.rb")].each {|f| require f}
