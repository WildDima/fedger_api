require_relative '../lib/fedger_api'
require 'webmock/rspec'
require 'vcr'

RSpec.configure do |config|

end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.default_cassette_options = { record: :new_episodes } 
end