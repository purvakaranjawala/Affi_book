class RelationshipsController < ApplicationController
  def index
    @relationships = current_user.relationships.all
  end

  def create
   @relationship = current_user.relationships.build(:followed_id => params[:followed_id])
      @relationship.follower_id = current_user.id
      @relationship.user_id = current_user.id
    if @relationship.save
      flash[:notice] = "Followed"
      redirect_to :back
    else
      redirect_to @relationship
    end
  end

  def destroy
   @relationship =  current_user.relationships.find_by(followed_id: params[:id])
    @relationship.delete
    flash[:notice] = "Unfollowed"
    respond_to do |format|
     format.html { redirect_to (:back)}
     format.js 
    end
  end

  private
  def follow_params
   params.require(:relationship).permit(:follower_id,:followed_id,:user_id)
  end
end
