require 'rspec'

share_as :Delete_Env do
  describe 'deleting the env we just made' do
    it "selects the env" do
      ey_select_env
    end

    it "stops the env" do
      $debug and dump_page_source("/tmp/ey_env_to_stop.html")
      check_element_click('delete_env_stop')
      print "Waiting for environment to stop.  THIS WILL TAKE SEVERAL MINUTES.\n"
      begin
        refresh
        long_wait_for_element( 'delete_env_delete', 6 )
        $debug and dump_page_source("/tmp/ey_stopping_env.html")
      rescue Exception => e
        print "still waiting for booting: #{e}\n"
        retry
      end
    end

    it "selects the env" do
      ey_select_env
    end

    it "deletes the env" do
      $debug and dump_page_source("/tmp/ey_pre_delete_env.html")
      check_element_click('delete_env_delete')
      quiesce
    end
  end
end
