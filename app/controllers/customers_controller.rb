class CustomersController < ApplicationController
	before_action :authenticate_user!
	def index
	end

	def show
    @user = UserInfo.find(params[:id])
	end

	def new
   @user = UserInfo.new
  end

  def create
  @user = UserInfo.new(user_params)
    if  @user.save
     redirect_to @user
    else
      render 'new'
    end
  end

  private 
  def user_params
   params.require(:user_info).permit(:user_id,:address,:contact,:qualification,:dob,:gender,:write_about_you)
  end
end
