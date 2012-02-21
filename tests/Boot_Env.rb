require 'rspec'

share_as :Boot_Env do
  describe '1creates and starts a new environment' do
    it "goes to the dashboard" do
      check_element_send_keys('boot_env_enter_name')
    end

    it 'selects the stack' do
      no_move_click('boot_env_stack')
    end

    it 'selects the runtime' do
      no_move_click( 'boot_env_runtime_dropdown' )
      no_move_click( 'boot_env_pick_runtime' )
    end

    it 'selects the region' do
      no_move_click( 'boot_env_region_dropdown' )
      no_move_click( 'boot_env_pick_region' )
    end

    it 'selects the db stack' do
      no_move_click( 'boot_env_db_stack_dropdown' )
      no_move_click( 'boot_env_pick_db_stack' )
    end

    it 'clicks create environment' do
      check_element_click('boot_env_create')
    end

    it 'selects the cluster type' do
      $debug and dump_page_source("/tmp/ey_pick_cluster.html")
      no_move_click( 'boot_env_pick_cluster' )
    end

    it 'clicks boot environment' do
      check_element_click('boot_env_boot')
      print "Waiting for environment to boot.  THIS WILL TAKE SEVERAL MINUTES.\n"
      sleep 30
      $debug and dump_page_source("/tmp/ey_starting_env.html")
      begin
        quiesce( [ /starting/ ] )
      rescue Exception => e
        print "checking for starting errored out: #{e}\n"
      end

      begin
        refresh
        print "watching for building\n"
        quiesce( [ /starting/, /<span[^>]*building/ ] )
      rescue Exception => e
        print "still waiting for booting: #{e}\n"
        retry
      end
    end
  end
end
