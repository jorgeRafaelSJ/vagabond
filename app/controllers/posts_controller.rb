class PostsController < ApplicationController
	before_action :correct_user, only: :destroy
	def index
		@posts = Post.all
		@posts = Post.paginate(:page => params[:page], :per_page => 2)
		@city = City.find(params[:city_id])	
	end
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
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
		@city = City.find(params[:city_id])
		@user = User.find(@post.user_id)
	end

	def edit
		@post = Post.find(params[:id])
		@city = City.find(params[:city_id])
	end

	def update
		@post = Post.find(params[:id])
		@city = City.find(params[:city_id])
		if @post.update_attributes(post_params)
		 redirect_to city_post_path(@city, @post)
		else
		  render 'edit'
		end
	end

	def destroy
		city_id = params[:city_id]
		id = params[:id]
		@post = Post.find(id)
		@city = City.find(city_id)
		@post.delete
		flash[:success] = "Post destroyed"
		redirect_to root_path
		
	end


	private

		def post_params
			params.require(:post).permit(:title, :content)
		end

		def correct_user
			@post = current_user.posts.find_by(id: params[:id])
			redirect_to root_url if @post.nil?
		end

end