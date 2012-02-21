require 'rspec'

share_as :Boot_App do
  describe 'booting up a new environment with an app' do
    it "clicks new app" do
      @debug and dump_page_source("/tmp/ey_page_1.html")
      check_element_click('boot_app_click_new_app')
      @debug and dump_page_source("/tmp/ey_page_2.html")
    end

    it "enters the github url" do
      check_element_send_keys('boot_app_enter_git_url')
    end

    it "enters the app name" do
      check_element_send_keys('boot_app_enter_app_name')
    end

    it "picks the right app type" do
      no_move_click( 'boot_app_app_type_dropdown' )
      no_move_click( 'boot_app_pick_app_type' )
    end

    it "creates the app" do
      check_element_click('boot_app_app_submit')
      @debug and dump_page_source("/tmp/ey_new_env.html")
    end
  end
end
