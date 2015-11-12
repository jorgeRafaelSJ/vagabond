class UsersController < ApplicationController

	def new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to @user
	end

	def show
		@user = User.find(params[:id])
	end

	private

		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation, :full_name, :city)
		end
	
end
