require 'rspec'

share_as :Delete_Env do
  describe 'deleting the env we just made' do
    it "selects the env" do
      ey_select_env
    end

    it "stops the env" do
      $debug and dump_page_source("/tmp/ey_env_to_stop.html")
      check_element_click('delete_env_stop')
    end

    it "waits for the stopping to actually be done" do
      print "Waiting for environment to stop.  THIS WILL TAKE SEVERAL MINUTES.\n"
      sleep 30
      ey_element_wait( "the env to be deleted", 'delete_env_delete' )
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
