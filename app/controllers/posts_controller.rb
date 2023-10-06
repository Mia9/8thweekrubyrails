class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy, :like]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		# @post = Post.create(image: params[:post][:image], caption: params[:post][:caption], photos: params[:post][:photos])
		@post = current_user.posts.create(post_params)
		if @post.save
			redirect_to post_path(@post)
		else
			render :new
		end
	end

	def show #show selected post
		@comment = current_user.comments.new
	end

	def edit	
	end

	def update		
		# @post.update(image: params[:post][:image], caption: params[:post][:caption], photos: params[:post][:photos])
		@post.update(post_params) #.merge(image: params[:post][:image]))already removed image column so no need anymore
		if @post.save
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path(@post)
	end

	# def like
	# 	Like.create(user_id: current_user.id, post_id: @post.id)
	# 	redirect_back(fallback_location: root_path)
	# end


	def like
		current_user.likes.create(likeable: @post)
		redirect_back(fallback_location: root_path)
	end

	private #no need end for private method
		def set_post
			@post = Post.find(params[:id])
		end	

	def post_params
		params.require(:post).permit(:caption, photos: [])
	end
	


end

#after create private method, type before_action so that other def method can access the same codes
#for e.g : def show, edit, destroy and update since they use the same line of code.