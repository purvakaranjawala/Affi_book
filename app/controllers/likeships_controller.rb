class LikeshipsController < ApplicationController
  def index
  	@user = current_user
  	@posts = Post.all
  	@likeships = Likeship.all
  end

  def create
  	  @likeship = current_user.likeships.build(:post_id => params[:post_id])
        @likeship.user_id = current_user.id
    if @likeship.save
      flash[:notice] = "Liked!"
      redirect_to likeships_path(:id => params[:post_id])
    else
      redirect_to @likeship
    end
  end

  def destroy 
  	@likeship = Likeship.find(params[:id])
  	@likeship.destroy
  	redirect_to likeships_path
  	flash[:notice]="unliked"
  end

  private
  def likeship_params
  	params.require(:likeship).permit(:user_id,:post_id)
  end
end
