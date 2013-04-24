require 'bundler'
require 'rspec/core/rake_task'
Bundler::GemHelper.install_tasks

desc "Run all examples"
RSpec::Core::RakeTask.new('spec') do |t|
  t.rspec_opts = %w[--color -fs]
end

task :default => :spec