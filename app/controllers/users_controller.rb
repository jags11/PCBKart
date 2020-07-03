
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def search
    query = params[:search_users].presence && params[:search_users][:query]

    if query
      @users = User.search_all(query)
    end
  end

  def create
    @user = User.new(users_params)
    @user.is_admin = false
    if @user.save
      flash[:success] = "Account registered!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def users_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name)
  end
end