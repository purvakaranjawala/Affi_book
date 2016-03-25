class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.all
  end

  def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id],flag: false)
		if @friendship.save
			flash[:notice] = "Request Sent "
			redirect_to :back
		else
			flash[:notice] = "Unable to add friend."
			redirect_to root_url
		end
  end

  def update
      @friendship = Friendship.find(params[:id])
      @friendship.update(flag: true)
    if @friendship.save
      redirect_to friendships_path(:id => params[:friend_id]), :notice => "Successfully confirmed friend!"
    else
      redirect_to root_url, :notice => "Sorry! Could not confirm friend!"
    end
  end

  def destroy
	  @friendship = Friendship.find(params[:id])
	  @friendship.delete
	 flash[:notice] = "Removed friendship."
	  redirect_to :back
  end

  def show_friend_request
    @frnds = Friendship.where(:friend_id => current_user.id)
  end
  
 private
  def friend_params
   params.require(:friendship).permit(:user_id,:friend_id,:flag)
  end
end
