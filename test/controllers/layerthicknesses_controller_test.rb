require 'test_helper'

class LayerthicknessesControllerTest < ActionController::TestCase
  setup do
    @layerthickness = layerthicknesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:layerthicknesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create layerthickness" do
    assert_difference('Layerthickness.count') do
      post :create, layerthickness: { thickness: @layerthickness.thickness }
    end

    assert_redirected_to layerthickness_path(assigns(:layerthickness))
  end

  test "should show layerthickness" do
    get :show, id: @layerthickness
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @layerthickness
    assert_response :success
  end

  test "should update layerthickness" do
    patch :update, id: @layerthickness, layerthickness: { thickness: @layerthickness.thickness }
    assert_redirected_to layerthickness_path(assigns(:layerthickness))
  end

  test "should destroy layerthickness" do
    assert_difference('Layerthickness.count', -1) do
      delete :destroy, id: @layerthickness
    end

    assert_redirected_to layerthicknesses_path
  end
end
