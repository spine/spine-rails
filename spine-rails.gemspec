# -*- encoding: utf-8 -*-
require File.expand_path('../lib/spine/rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "spine-rails"
  s.version     = Spine::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alex MacCaw"]
  s.email       = ["info@eribium.org"]
  s.homepage    = "http://rubygems.org/gems/spine-rails"
  s.summary     = "Use Spine with Rails 3"
  s.description = "This gem provides Spine for your Rails 3 application."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "spine-rails"

  s.add_dependency             "rails", ">= 3.1.0"
  s.add_development_dependency "bundler"
  
  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'
end