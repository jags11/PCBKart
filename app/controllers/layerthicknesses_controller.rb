class LayerthicknessesController < ApplicationController
  before_action :set_layerthickness, only: [:show, :edit, :update, :destroy]

  # GET /layerthicknesses
  def index
    @layerthicknesses = Layerthickness.all
  end

  # GET /layerthicknesses/1
  def show
  end

  # GET /layerthicknesses/new
  def new
    @layerthickness = Layerthickness.new
  end

  # GET /layerthicknesses/1/edit
  def edit
  end

  # POST /layerthicknesses
  def create
    @layerthickness = Layerthickness.new(layerthickness_params)

    if @layerthickness.save
      redirect_to @layerthickness, notice: 'Layerthickness was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /layerthicknesses/1
  def update
    if @layerthickness.update(layerthickness_params)
      redirect_to @layerthickness, notice: 'Layerthickness was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /layerthicknesses/1
  def destroy
    @layerthickness.destroy
    redirect_to layerthicknesses_url, notice: 'Layerthickness was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_layerthickness
      @layerthickness = Layerthickness.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def layerthickness_params
      params.require(:layerthickness).permit(:thickness, :layer_id)
    end
end
# meta programming in rails
# scope
# model callbacks
# active support concerns
#