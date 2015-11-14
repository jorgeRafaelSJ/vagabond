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
			session[:user_id] = @user.id
			redirect_to @user
		else
			redirect_to :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
		 redirect_to user_path(@user)
		else
		  render 'edit'
		end
	end

	private

	def user_params
		params.require(:user).permit(:avatar, :email, :password, :password_confirmation, :full_name, :city)
	end

end

