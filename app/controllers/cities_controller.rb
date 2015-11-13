class CitiesController < ApplicationController
	def index
		@cities = City.all
	end

	def show
		@city = City.find(params[:id])
		@posts = Post.where(city_id: @city.id)
	end

end
