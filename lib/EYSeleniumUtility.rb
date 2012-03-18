module EYSeleniumUtility
  def ey_select_env
    go_to('dashboard')
    check_element_click('env_link')
  end

  def ey_select_app
    go_to('dashboard')
    check_element_click('app_link')
  end
end
