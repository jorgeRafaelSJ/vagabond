class PostsController < ApplicationController
	def new
		@post = Post.new
		@city = City.find(params[:city_id])	
		render :new
	end

	def create
		@post = Post.new(post_params)
		@city = City.find(params[:city_id])
		if @post.save
			@city.posts.push(@post)
			redirect_to city_path(@city)
		else
			redirect_to new_post_path
		end

	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end
end