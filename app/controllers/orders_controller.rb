class OrdersController < ApplicationController
  include ApplicationHelper
  include Pagy::Backend

  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :require_user

  # GET /orders
  def index
    if current_user.is_admin == false
      @orders = Order.where(user_id: current_user.id)
    else
      @pagy, @orders = pagy(Order.all, items: 5)
    end
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.layer_id = Layer.first.id
    @order.quantity = 10
    @order.board_size_y = 10
    @order.board_size_x = 10
    @filtered_thicknesses = Layerthickness.where(layer_id: @order.layer_id)

    pcbPrice = PcbPricing.where(layerthickness_id: @filtered_thicknesses[0].id)
    @order.pcb_price = pcbPrice[0].price_per_unit_sq_cm * @order.board_size_y * @order.board_size_x * @order.quantity
    @order.shipment_charge=50
    @order.tax = 15
    @order.total_price=@order.pcb_price + 50 + 15
    @order.status = "CREATED"
  end

  # GET /orders/1/edit
  def edit
    @filtered_thicknesses = Layerthickness.where(layer_id: 1)
  end

  # POST /orders
  def create

    @order = Order.new(order_params)
    pcbPrice = PcbPricing.where(layerthickness_id: params[:order][:layerthickness_id])
    @order.pcb_pricing_id = pcbPrice[0].id
    @order.user = current_user
    if @order.save
      HelloWorldJob.perform_later
      TestMailer.test_send(@order.user.email, @order.id.to_s).deliver_later
      redirect_to @order, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  def calculate_order
    pcbPrice = PcbPricing.where(layerthickness_id: params[:selected_layerthickness_id])
    @order = Order.new
    @order.pcb_price = pcbPrice[0].price_per_unit_sq_cm * params[:board_size_y].to_i * params[:board_size_x] .to_i * params[:quantity].to_i
    @order.shipment_charge=50
    @order.tax = 15
    @order.total_price=@order.pcb_price + 50 + 15
    @order
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  def filter_thicknesses_by_layer
    @filtered_thicknesses = Layerthickness.where(layer_id: params[:selected_layer])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:pcb_price, :shipment_charge, :tax, :total_price, :status)
    end
end
