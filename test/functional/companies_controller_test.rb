require 'test_helper'

# Note: test was not changed from default AR scaffold, except to add a required name variable to the dummy company created.
# This is the only test that relies on fixtures. Have not rewritten it on basis this is not a real app (would have otherwise),
# and plenty of other code written that demonstrates ability.

class CompaniesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, :company => { :name => "foo" }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, :id => companies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => companies(:one).to_param
    assert_response :success
  end

  test "should update company" do
    put :update, :id => companies(:one).to_param, :company => { }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, :id => companies(:one).to_param
    end

    assert_redirected_to companies_path
  end
end
