class PostsController < ApplicationController
	def new
		@post = Post.new	
		render :new
	end

	def create
		@post = Post.new(post_params)
#need to define @city
		if @post.save
			# redirect_to city_path(@city)
		else
			# redirect_to new_post_path
	end

	private

		def post_params
			params.require(:post).permit(:title, :content)
		end
	end
end

