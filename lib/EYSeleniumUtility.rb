module EYSeleniumUtility
  def ey_select_env
    go_to('dashboard')
    check_element_click('env_link')
  end

  def ey_select_app
    go_to('dashboard')
    check_element_click('app_link')
  end

  # Response to our dropdowns is somewhat unreliable, so we work for
  # it.  In particular, the second click seems to help.
  def ey_ensure_dropdown( dropdown, option )
    while ! $driver.find_element(get_yaml_data( option, 0 ), get_yaml_data( option, 1 ) ).attribute('selected')
      $debug and print "status: #{$driver.find_element(get_yaml_data( option, 0 ), get_yaml_data( option, 1 ) ).attribute('selected')}\n"
      $debug and print "dropdown: #{dropdown}\n"
      no_move_click( dropdown )
      sleep 1
      $debug and sleep 5
      $debug and print "option: #{option}\n"
      no_move_click( option )
      sleep 1
      no_move_click( option )
    end
  end

  def ey_wait( text, regexes )
      $debug and dump_page_source("/tmp/ey_wait.html")
      begin
        quiesce( regexes )
      rescue Exception => e
        print "Waiting for #{text} errored out during waiting for page to settle: #{e}\n"
      end

      begin
        print "Now watching for messages and refreshing, for as long as it takes.\n"
        refresh
        quiesce( regexes )
      rescue Selenium::WebDriver::Error::UnknownError => e
        print "Waiting for #{text} errored out: #{e.class.name}, #{e.inspect}, #{e}\n"
      rescue RSpec::Expectations::ExpectationNotMetError => e
        $debug and print "still waiting for #{text}, rspec complained, ignoring it\n"
        retry
      rescue Exception => e
        $debug and print "still waiting for #{text}, got an unknown error, ignoring it: #{e.class.name}, #{e.inspect}, #{e}\n"
        retry
      end
  end

  def ey_element_wait( text, element )
      $debug and dump_page_source("/tmp/ey_element_wait.html")
      begin
        print "Now watching for the element requested and refreshing, for as long as it takes.\n"
        refresh
        long_wait_for_element( element, 6 )
      rescue Selenium::WebDriver::Error::UnknownError => e
        print "Waiting for #{text} errored out: #{e.class.name}, #{e.inspect}, #{e}\n"
      rescue RSpec::Expectations::ExpectationNotMetError => e
        $debug and print "still waiting for #{text}, rspec complained, ignoring it\n"
        retry
      rescue Exception => e
        $debug and print "still waiting for #{text}, got an unknown error, ignoring it: #{e.class.name}, #{e.inspect}, #{e}\n"
        retry
      end
  end
end
