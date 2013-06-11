#!/usr/bin/env ruby
if ENV['SPEC']
  specs = ["../../spec/QA/#{ENV['SPEC']}"]
else
  specs = ["../../spec/QA/br_local_*",
         "../../spec/QA/br_login_*",
         "../../spec/QA/br_sanity_*"]
end
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

header("VISTA")

separator("Chrome")
ENV['BROWSER'] = 'chrome'
ENV['OS'] = 'VISTA'
ENV['ENVIRONMENT'] = 'alpha' unless ENV['ENVIRONMENT'] != nil

success = system("bundle exec parallel_rspec -n 20 #{specs.join(' ')}") && success

exit(success)
