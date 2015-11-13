class CitiesController < ApplicationController
	def index
		@cities = City.all
	end

	def show
		@city = City.find(params[:id])
		@posts = Post.where(city_id:(@city))
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to city_path(@city)
		else
			redirect_to new_post_path
	end

	private

		def post_params
			params.require(:post).permit(:title, :content)
		end
	end

end
end
