#!/usr/bin/env ruby

specs = ["../../spec/qa/iphone6/*"]

def separator(text, double=false)
  puts('#' * 78) if double
  puts text
  puts('#' * 78)
end

def header(text)
  separator(text, true)
end

success = true

separator("Updating Gems")
system("bundle install --path vendor/gems --binstubs")

separator("QA iPhone 6 Tests")
ENV['TEST_ENV'] = 'iphone6'
ENV['ENVIRONMENT'] = 'beta'
success = system("bundle exec parallel_rspec -n 20 #{specs.join(' ')}")

exit(success)
