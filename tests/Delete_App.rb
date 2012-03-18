require 'rspec'

share_as :Delete_App do
  describe 'deleting the app we just made' do
    it "selects the app" do
      ey_select_app
    end

    it "deletes the app" do
      @debug and dump_page_source("/tmp/ey_pre_delete.html")
      check_element_click('delete_app_delete')
# (rdb:1) e sleep 5 ; e @driver.find_element(:xpath, "//button[contains(@class,'delete')]" ).click ; e @driver.switch_to.alert.accept

#(rdb:1) e @driver.find_element(:xpath, "//button[contains(@class,'delete')]" ).click
    end

  end
end
