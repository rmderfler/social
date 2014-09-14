class FriendshipsController < ApplicationController
  def create
    @user = current_user
    @friend = User.find(params[:friend_id])
    if !@user.friends.include?(@friend)
      @friendship = current_user.friendships.build(:friend_id => params[:friend_id], :user_email => current_user.email)
      if @friendship.save
        flash[:notice] = "Added friend."
        redirect_to root_url
      else
        flash[:error] = "Unable to create friend."
        redirect_to root_url
      end
    else 
      flash[:notice] = "You are already friends"
      redirect_to root_url
    end
  end

def destroy
  @friendship = current_user.friendships.find(params[:id])
  @friendship.destroy
  flash[:notice] = "Removed friendship."
  redirect_to current_user
end
end