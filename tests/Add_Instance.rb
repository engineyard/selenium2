require 'rspec'

share_as :Add_Instance do
  describe 'adding a new instance' do
    it "selects the env" do
      ey_select_env
    end

    it "clicks add" do
      check_element_click('add_instance_add')
    end

    it "selects the instance type" do
      no_move_click( 'add_instance_pick_type' )
    end

    it "actually adds the instance" do
      check_element_click('add_instance_final_add')
    end

    it "waits for the adding to actually be done" do
      print "Waiting for the instance to boot.  THIS WILL TAKE SEVERAL MINUTES.\n"
      sleep 30
      ey_wait( "the instance to boot", [ /starting/, /<span[^>]*building/ ] )
    end
  end
end
