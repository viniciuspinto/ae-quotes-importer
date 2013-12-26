require 'rake'
require 'standalone_migrations'

StandaloneMigrations::Tasks.load_tasks

namespace :test do
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new :rspec do |t|
    t.pattern = 'spec/**/*_spec.rb'
  end
end

task :default => 'test:rspec'
