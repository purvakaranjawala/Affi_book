class ProfilesController < ApplicationController
 
	def dashboard
	end

	def index
		@user = User.all.where("id!=?",current_user.id)
	end

	def show
		@profile = Profile.find(params[:user_id])
	end

	def new
	 @profile = Profile.new
	end

	def create
		@profile = current_user.build_profile(profile_params)
		if @profile.save
			redirect_to  user_profile_path(@profile.id,current_user.id)
		else
			render 'new'
		end
	end

	private 
	def profile_params
	params.require(:profile).permit(:user_id,:address,:contact,:qualification,:dob,:gender)
	end
end
