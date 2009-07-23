require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  
  context "get on homepage" do
    setup do
      get :index
    end

    should_respond_with :success
    should_render_template :index
    should_not_set_the_flash
  end

end
