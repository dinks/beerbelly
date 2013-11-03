# encoding: UTF-8

# Load the lib to the path
$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'bundler/setup'
require 'webmock/rspec'
require 'vcr'
require 'beerbelly_setup'
require 'beerbelly'

RSpec.configure do |config|
  config.order = 'rand'

  # Add the Beerbelly Setting
  config.add_setting :beerbelly
end

RSpec.configuration.beerbelly = BeerbellySetup

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.allow_http_connections_when_no_cassette = true
  c.hook_into :webmock
end
