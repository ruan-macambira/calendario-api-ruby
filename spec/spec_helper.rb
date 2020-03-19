# frozen_string_literal: true

require 'bundler/setup'
require 'calendario_api'
require 'webmock/rspec'
require 'vcr'
require 'simplecov'

RSpec.configure do |config|
  SimpleCov.start

  VCR.configure do |vcr_config|
    vcr_config.cassette_library_dir = 'spec/vcr_cassettes'
    vcr_config.hook_into :webmock
    vcr_config.configure_rspec_metadata!

    vcr_config.filter_sensitive_data('<API_TOKEN>') { ENV['CALENDARIO_API_TOKEN'] }
  end
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # Ordem dos testes aleatória
  config.order = :random

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
