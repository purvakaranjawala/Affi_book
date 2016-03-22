class FriendshipsController < ApplicationController
  def index
    @friendships = Friendship.all
  end

  def show
  end

  def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save
			puts "Added friend."
			redirect_to friendships_path(:id => params[:friend_id])
		else
			puts "Unable to add friend."
			redirect_to root_url
		end
  end

  def destroy
	  @friendship = current_user.friendships.find(params[:id])
	  @friendship.destroy
	  puts "Removed friendship."
	  redirect_to friendships_path
  end
end
