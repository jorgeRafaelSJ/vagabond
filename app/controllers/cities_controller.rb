class CitiesController < ApplicationController
	def index
		@cities = City.all
	end

	def show
		@city = City.find(params[:id])
		@posts = Post.where(city_id: @city)
		@users = User.where(@posts.count >= 1)
	end

end

