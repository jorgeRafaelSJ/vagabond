class SessionsController < ApplicationController
  
  #LOGIN FORM
  def new
  end

  #LOGIN
  def create
  	@user = User.find_by(email: user_params[:email])
   
  	if @user.authenticate(user_params[:password])
  		session[:user_id] = @user.id

  		redirect_to user_path(current_user)
  	else
  		render :new
  	end
  end

  #LOGOUT
  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end

	private

		def user_params
			params.require(:user).permit(:email, :password)
		end
end
