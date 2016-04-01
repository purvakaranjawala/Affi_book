class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def new
  	@post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
  	if @post.save
      redirect_to  posts_path
  	else
  	  render 'new'
    end
  end

  def edit 
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
      redirect_to   posts_my_post_path(@post)
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def my_post
     @myposts = current_user.posts.all
  end

  private
  def post_params
  	params.require(:post).permit(:user_id,:post_artical)
  end
end
