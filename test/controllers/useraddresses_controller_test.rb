require 'test_helper'

class UseraddressesControllerTest < ActionController::TestCase
  setup do
    @useraddress = useraddresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:useraddresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create useraddress" do
    assert_difference('Useraddress.count') do
      post :create, useraddress: { address: @useraddress.address, city: @useraddress.city, pincode: @useraddress.pincode }
    end

    assert_redirected_to useraddress_path(assigns(:useraddress))
  end

  test "should show useraddress" do
    get :show, id: @useraddress
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @useraddress
    assert_response :success
  end

  test "should update useraddress" do
    patch :update, id: @useraddress, useraddress: { address: @useraddress.address, city: @useraddress.city, pincode: @useraddress.pincode }
    assert_redirected_to useraddress_path(assigns(:useraddress))
  end

  test "should destroy useraddress" do
    assert_difference('Useraddress.count', -1) do
      delete :destroy, id: @useraddress
    end

    assert_redirected_to useraddresses_path
  end
end
