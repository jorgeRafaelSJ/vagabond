class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
		@posts = Post.where(user_id:(@user))
	end

	def new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to @user
		end
	end

	private

		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation, :full_name, :city)
		end

end
