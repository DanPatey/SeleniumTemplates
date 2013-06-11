SeleniumTemplates
=================
#Step 1 #
Run 'bundle' in the SeleniumTemplates directory

#Step 2 #
Add server urls and your Sauce key to spec_helper.rb located in: 
spec/QA/, spec/QA/ipad, spec/QA/iphone, spec/QA/android

#Step 3 #
Kickoff tests by running ./script/QA/shorttests.rb or ./script/QA/iphone6.rb

#Arguments #
Tests are actually run by issuing arguments to parallel_rspec. Arguments
available are OS, ENVIRONMENT, and BROWSER. For example to run sanity
tests on Vista in Chrome on your Beta staging environment you would
issue in the terminal 'OS=VISTA ENVIRONMENT=beta BROWSER=chrome
parallel_rspec -n 20 ../../spec/QA/br_sanity_*'
# Send any questions to DanPatey@BleacherReport.com #
