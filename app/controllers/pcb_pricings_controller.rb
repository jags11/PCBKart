class PcbPricingsController < ApplicationController
  include ApplicationHelper

  before_action :set_pcb_pricing, only: [:show, :edit, :update, :destroy]
  before_action :require_admin
  # GET /pcb_pricings
  def index
    @pcb_pricings = PcbPricing.all
  end

  # GET /pcb_pricings/1
  def show
  end

  # GET /pcb_pricings/new
  def new
    @pcb_pricing = PcbPricing.new
  end

  # GET /pcb_pricings/1/edit
  def edit
  end

  # POST /pcb_pricings
  def create
    @pcb_pricing = PcbPricing.new(pcb_pricing_params)

    if @pcb_pricing.save
      redirect_to @pcb_pricing, notice: 'Pcb pricing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pcb_pricings/1
  def update
    if @pcb_pricing.update(pcb_pricing_params)
      redirect_to @pcb_pricing, notice: 'Pcb pricing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pcb_pricings/1
  def destroy
    @pcb_pricing.destroy
    redirect_to pcb_pricings_url, notice: 'Pcb pricing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pcb_pricing
      @pcb_pricing = PcbPricing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pcb_pricing_params
      params.require(:pcb_pricing).permit(:quantity_from, :quantity_to, :price_per_unit_sq_cm, :layerthickness_id)
    end
end
