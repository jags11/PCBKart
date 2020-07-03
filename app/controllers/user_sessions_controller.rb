class UserSessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "logged in successfully"
      session[:user_id] = user.id
      redirect_to orders_path
    else
      flash.now[:alert] = "Invalid credentials"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out successfully!"
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end