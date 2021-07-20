# frozen_string_literal: true

require "esi-sdk"

require "simplecov"
require "simplecov_json_formatter"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::HTMLFormatter,
                                                                 SimpleCov::Formatter::JSONFormatter
                                                               ])
SimpleCov.start

require "webmock/rspec"
WebMock.disable_net_connect!

require "vcr"
VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.disable_monkey_patching!

  config.default_formatter = config.files_to_run.one? ? "doc" : "progress"
  config.example_status_persistence_file_path = ".rspec_status"
  config.order = :random
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.around type: :integration do |example|
    WebMock.allow_net_connect!(net_http_connect_on_start: true)
    example.run
    WebMock.disable_net_connect!
  end

  config.around type: :stub do |example|
    VCR.turn_off!
    example.run
    VCR.turn_on!
  end
end
