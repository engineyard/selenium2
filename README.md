
See the repo this was forked from for general stuff about how to use
these Selenium tools.

Currently it uses rpowell's creds, so be nice.  :)

To run, set up your Selenium (i.e. download and run the Selenium
Server jar at http://seleniumhq.org/download/ ), and do this:

    ./bin/runtest.rb -p 7444 -e postgres

Where 7444 is the port your Selenium, or your port-forwarded
Selenium, is running on.
