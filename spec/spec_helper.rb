ENV["RAILS_ENV"] = "test"

require 'rubygems'
require 'bundler/setup'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
#require "rails/test_help"
require "rspec/rails"

require 'spine-rails'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
  require 'rspec/mocks'
  require 'rspec/expectations'
  config.include RSpec::Matchers
  config.mock_with :rspec
end
