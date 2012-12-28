require 'rspec/autorun'
require 'mongoid-rspec'
require 'mocha/setup'

RSpec.configure do |configuration|
  configuration.mock_with :mocha
  configuration.include Mongoid::Matchers
end
