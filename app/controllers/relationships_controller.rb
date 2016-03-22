class RelationshipsController < ApplicationController
  def index
    @relationships = Relationship.all
    @posts = Post.all.where(:user_id => params[:id])
    #@user = User.all.where(:id => params[:id])
  end

  def create
   @relationship = current_user.relationships.build(:followed_id => params[:followed_id])
        @relationship.follower_id = current_user.id
        @relationship.user_id = current_user.id
    if @relationship.save
      puts "you followed"
      redirect_to relationships_path(:id => params[:followed_id])
    else
      redirect_to @relationship
    end
  end

  def destroy
    @relationship = current_user.relationships.find(params[:id])
    @relationship.destroy
    flash[:notice] = "Unfollowed"
    redirect_to relationships_path
  end

  private
  def follow_params
   params.require(:relationship).permit(:follower_id,:followed_id,:user_id)
  end
end
