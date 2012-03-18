
See the repo this was forked from for general stuff about how to use
these Selenium tools.

Currently it uses rpowell's creds, so be nice.  :)

To run, set up your Selenium (i.e. download and run the Selenium
Server jar at http://seleniumhq.org/download/ ), and do this:

    ./bin/runtest.rb -t setup -c app_url='https://github.com/engineyard/todo' -c app_stack=Trinidad -c runtime='JRuby 1.6.7 (ruby-1.8.7-p330)' -c region='Europe' -c app_type='Rails 3' -c cpu_type='32-bit' -c environment_type='single' -c db_stack='PostgreSQL 9.1.x (Beta)' -c main_stack='QA' -c name="testenv"

Where 7444 is the port your Selenium, or your port-forwarded
Selenium, is running on.

This will create and boot an app and environement as specified.  Run this to delete it:

    ./bin/runtest.rb -t teardown -c app_url='https://github.com/engineyard/todo' -c app_stack=Trinidad -c runtime='JRuby 1.6.7 (ruby-1.8.7-p330)' -c region='Europe' -c app_type='Rails 3' -c cpu_type='32-bit' -c environment_type='single' -c db_stack='PostgreSQL 9.1.x (Beta)' -c main_stack='QA' -c name="testenv"
