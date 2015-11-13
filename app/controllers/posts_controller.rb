class PostsController < ApplicationController
	def new
		@post = Post.new
		@city = City.find(params[:city_id])	
		render :new
	end

	def create
		@post = current_user.posts.create(post_params)
		@city = City.find(params[:city_id])
		if @post.save
			@city.posts << @post
			redirect_to city_path(@city)
		else
			redirect_to new_city_post_path(@city)
		end
	end

	def show
		@post = Post.find(params[:id])
		@city = City.find(params[:city_id])
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end
end