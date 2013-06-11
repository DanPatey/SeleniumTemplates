require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Run selenium tests locally"
task :local do
  ENV['TEST_ENV'] = 'local'
  ENV['BROWSER'] ||= 'chrome'
  Rake::Task['spec'].invoke
end

desc "Run iPhone tests"
task :iphone do
  ENV['TEST_ENV'] = 'iphone'
  Rake::Task['spec'].invoke
end

desc "Run Android tests"
task :android do
  ENV['TEST_ENV'] = 'android'
  Rake::Task['spec'].invoke
end
