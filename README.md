
See the repo this was forked from for general stuff about how to use
these Selenium tools.

Currently it uses rpowell's creds, so be nice.  :)

Currently the tests aren't really tests, they're more a set of tools
to drive our system via the web UI by hand.  The idea is that by
constructing a set of such tools, eventually there will be enough
that putting together actual tests will be easy.

To run, set up your Selenium (i.e. download and run the Selenium
Server jar at http://seleniumhq.org/download/ ), and do this:

    ./bin/runtest.rb -t setup -c app_url='https://github.com/engineyard/todo' -c app_stack=Trinidad -c runtime='JRuby 1.6.7 (ruby-1.8.7-p330)' -c region='Europe' -c app_type='Rails 3' -c cpu_type='32-bit' -c environment_type='single' -c db_stack='PostgreSQL 9.1.x (Beta)' -c main_stack='QA' -c name="testenv"

Where 7444 is the port your Selenium, or your port-forwarded
Selenium, is running on.

This will create and boot an app and environement as specified.  Run this to delete it:

    ./bin/runtest.rb -t teardown -c app_url='https://github.com/engineyard/todo' -c app_stack=Trinidad -c runtime='JRuby 1.6.7 (ruby-1.8.7-p330)' -c region='Europe' -c app_type='Rails 3' -c cpu_type='32-bit' -c environment_type='single' -c db_stack='PostgreSQL 9.1.x (Beta)' -c main_stack='QA' -c name="testenv"

Tests And Options
=================

This is a list of all the "tests" (basically little tool thingies)
that are currently available, and the command line options they
take.

Note that in all cases all options must be filled in, or weird
things will happen.

Note that many of the options are based on the literal text you see
on your browser screen, to aid users in dealing with product changes
as they use these tools.  This means they have to be quoted in the
shell; single quotes are probably best.  Similarily things with
parens or other shell special characters.

all
---

- name: the name that will be used as a basis for the name of your env and app

setup
-----

- app_url: just the url to your application's git repo
- app_type: literal text from the Application Type dropdown, so:
  - Rails 3
  - Rails 2
  - Rack
  - Merb
  - Sinatra
- app_stack: literal text from the "Application Server Stack" radio, so:
  - Passenger 2
  - Passenger 3
  - Unicorn
  - Trinidad
  - Thin
  - Puma
- runtime: literal text from the "Runtime" dropdown, so:
  - Ruby 1.8.7
  - REE 2011.12
  - Ruby 1.9.2
  - Ruby 1.9.3 (beta)
  - JRuby 1.6.7 (ruby-1.8.7-p330)
  - JRuby 1.6.7 (ruby-1.9.2-p136)
- region: literal text from the "Region" dropdown, so:
  - Eastern United States
  - Western US (Northern CA)
  - Western US (Oregon)
  - South America
  - Europe
  - Singapore
  - Japan
- main_stack: literal text from the "Stack" dropdown, so:
  - QA
  - chef_o_ten
  - chefcleanup
  - erik
  - ines
  - ines_newami
  - new_hope
  - newami
  - nodejs
  - php
  - stable
  - stable-v1
  - stable-v2
  - stable-v3
  - staging
- db_stack: literal text from the "Database Stack" dropdown, so:
  - MySQL 5.0.x
  - MySQL 5.5.x (Beta)
  - PostgreSQL 9.1.x (Beta)
- environment_type: the clustery-ness.  valid values:
  - single
  - cluster
  - custom
