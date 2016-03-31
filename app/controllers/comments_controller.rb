class CommentsController < ApplicationController
  
  def index
    @comment = Comment.all
  end

  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build(comment_params)
  	@comment.user_id = current_user.id
  	if @comment.save
  	redirect_to  post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
 

  private 
  def comment_params
  	 params.require(:comment).permit(:user_id, :post_id,:comment_post)
  end
end
