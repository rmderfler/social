class MessagesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @messages = @user.messages.all
  end

  def new
    @user = User.find(params[:user_id])
    @message = @user.messages.new
  end

  def create
    @user = User.find(params[:user_id])
    @message = @user.messages.new(message_params)
    if @message.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @message = @user.messages.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end