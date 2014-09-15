class UsersController < ApplicationController
  before_filter :authorize, except: [:index, :new]

  def index
    @users = User.all.order("email")
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @messages = @user.messages.all
    @friends_messages = @user.friends_messages
  end

private


  def authorize
    @user = User.find(params[:id])
    redirect_to login_url, alert: "Not authorized!" if current_user != @user
  end


    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
