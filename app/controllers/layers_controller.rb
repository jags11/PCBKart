class LayersController < ApplicationController
  include ApplicationHelper

  before_action :require_admin
  before_action :set_layer, only: [:show, :edit, :update, :destroy]

  # GET /layers
  def index
    @layers = Layer.all
  end

  # GET /layers/1
  def show
  end

  # GET /layers/new
  def new
    @layer = Layer.new
  end

  # GET /layers/1/edit
  def edit
  end

  # POST /layers
  def create
    @layer = Layer.new(layer_params)

    if @layer.save
      redirect_to @layer, notice: 'Layer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /layers/1
  def update
    if @layer.update(layer_params)
      redirect_to @layer, notice: 'Layer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /layers/1
  def destroy
    @layer.destroy
    redirect_to layers_url, notice: 'Layer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_layer
      @layer = Layer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def layer_params
      params.require(:layer).permit(:layercount)
    end
end
