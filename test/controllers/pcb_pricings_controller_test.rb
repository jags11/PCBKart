require 'test_helper'

class PcbPricingsControllerTest < ActionController::TestCase
  setup do
    @pcb_pricing = pcb_pricings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pcb_pricings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pcb_pricing" do
    assert_difference('PcbPricing.count') do
      post :create, pcb_pricing: { price_per_unit_sq_cm: @pcb_pricing.price_per_unit_sq_cm, quantity_from: @pcb_pricing.quantity_from, quantity_to: @pcb_pricing.quantity_to }
    end

    assert_redirected_to pcb_pricing_path(assigns(:pcb_pricing))
  end

  test "should show pcb_pricing" do
    get :show, id: @pcb_pricing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pcb_pricing
    assert_response :success
  end

  test "should update pcb_pricing" do
    patch :update, id: @pcb_pricing, pcb_pricing: { price_per_unit_sq_cm: @pcb_pricing.price_per_unit_sq_cm, quantity_from: @pcb_pricing.quantity_from, quantity_to: @pcb_pricing.quantity_to }
    assert_redirected_to pcb_pricing_path(assigns(:pcb_pricing))
  end

  test "should destroy pcb_pricing" do
    assert_difference('PcbPricing.count', -1) do
      delete :destroy, id: @pcb_pricing
    end

    assert_redirected_to pcb_pricings_path
  end
end
