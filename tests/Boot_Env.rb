require 'rspec'

share_as :Boot_Env do
  describe 'creates and starts a new environment' do
    it "goes to the dashboard" do
      check_element_send_keys('boot_env_enter_name')
    end

    it 'selects the stack' do
      no_move_click('boot_env_stack')
    end

    it 'selects the runtime' do
      ey_ensure_dropdown( 'boot_env_runtime_dropdown', 'boot_env_pick_runtime' )
    end

    it 'selects the main stack' do
      ey_ensure_dropdown( 'boot_env_main_stack_dropdown', 'boot_env_pick_main_stack' )
    end

    it 'selects the db stack' do
      ey_ensure_dropdown( 'boot_env_db_stack_dropdown', 'boot_env_pick_db_stack' )
    end

    it 'selects the region' do
      ey_ensure_dropdown( 'boot_env_region_dropdown', 'boot_env_pick_region' )
    end

    it 'clicks create environment' do
      check_element_click('boot_env_create')
    end

    # rspec needs to know the number of tests in advance, so this is
    # all one test even though it's a bit complicated
    it 'selects the cluster type and configures the cluster' do
      $debug and dump_page_source("/tmp/ey_pick_cluster.html")
      no_move_click( 'boot_env_pick_cluster' )

      if get_cli_arg( 'cluster_type' ) == 'custom'
        check_element_send_keys('boot_cluster_number_of_app_instances')
        ey_ensure_dropdown( 'boot_cluster_app_instance_size_dropdown', 'boot_cluster_app_instance_size_option' )
        ey_ensure_dropdown( 'boot_cluster_master_db_instance_size_dropdown', 'boot_cluster_master_db_instance_size_option' )
        ey_ensure_dropdown( 'boot_cluster_slave_db_instance_size_dropdown', 'boot_cluster_slave_db_instance_size_option' )
        check_element_send_keys('boot_cluster_slave_db_instance_number')
      end
    end

    it 'clicks boot environment' do
      check_element_click('boot_env_boot')
    end

    it "waits for the booting to actually be done" do
      print "Waiting for the environment to boot.  THIS WILL TAKE SEVERAL MINUTES.\n"
      sleep 30
      ey_wait( "the environment to boot", [ /starting/, /<span[^>]*building/ ] )
    end
  end
end
