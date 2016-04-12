class LikeshipsController < ApplicationController
  def index
  	@user = current_user
  	@posts = Post.all
  	@likeships = Likeship.all
  end

  def create
  	  @likeship = current_user.likeships.build(:post_id => params[:post_id],flag: true)
    if @likeship.save
      flash[:notice] = "Liked!"
      redirect_to likeships_path(:user_id => params[:user_id])
    else
      redirect_to @likeship
    end
  end

  def destroy 
  	@likeship = current_user.likeships.find_by(user_id: params[:id])
  	@likeship.delete
  	redirect_to likeships_path
  	flash[:notice]="unliked"
  end

  private
  def likeship_params
  	params.require(:likeship).permit(:user_id,:post_id)
  end
end
