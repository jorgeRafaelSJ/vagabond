class CitiesController < ApplicationController
	def index
		@cities = City.all
	end

	def show
		@city = City.find(params[:id])
		@posts = Post.where(city_id: @city).reverse_order.all.paginate(page: params[:page], per_page: 10)
	end

end

