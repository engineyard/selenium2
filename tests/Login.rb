require 'rspec'

share_as :Login do
  describe 'logging into engineyard ruby cloud' do
    it "should load the remote driver" do
      @driver.manage.timeouts.implicit_wait = 5 # seconds
      @driver.class.name.should == "Selenium::WebDriver::Driver"
    end

    it "should load the login page" do
      @driver.navigate.to @server_url
      wait_for_element('login_page_check')
    end

    it 'should take the login input' do
      check_element_send_keys('login_send_email')
      check_element_send_keys('login_send_password')
      check_element_click('login_click_login')
    end

  end
end

