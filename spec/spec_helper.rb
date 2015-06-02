require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_group 'models', 'lib/usabilla_api/models'
  add_group 'clients', 'lib/usabilla_api/clients'
end

require 'rubygems'
require 'usabilla_api'
require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.before(:each){
    UsabillaApi.configuration.access_key = 'access-key'
    UsabillaApi.configuration.secret_key = 'secret-key'
  }
end

require 'support/convenience'
include UsabillaApi::SpecSupport::Convenience
