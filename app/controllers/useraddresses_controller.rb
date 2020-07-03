class UseraddressesController < ApplicationController
  before_action :set_useraddress, only: [:show, :edit, :update, :destroy]

  # GET /useraddresses
  def index
    @useraddresses = Useraddress.all
  end

  # GET /useraddresses/1
  def show
  end

  # GET /useraddresses/new
  def new
    @useraddress = Useraddress.new
  end

  # GET /useraddresses/1/edit
  def edit
  end

  # POST /useraddresses
  def create
    @useraddress = Useraddress.new(useraddress_params)

    if @useraddress.save
      redirect_to @useraddress, notice: 'Useraddress was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /useraddresses/1
  def update
    if @useraddress.update(useraddress_params)
      redirect_to @useraddress, notice: 'Useraddress was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /useraddresses/1
  def destroy
    @useraddress.destroy
    redirect_to useraddresses_url, notice: 'Useraddress was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_useraddress
      @useraddress = Useraddress.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def useraddress_params
      params.require(:useraddress).permit(:address, :city, :pincode)
    end
end
