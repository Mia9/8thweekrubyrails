class LikesController < ApplicationController

	def create
		if params[:likeable_type] == "Post"
			@object = Post.find(params[:likeable])
		else
			@object = Comment.find(params[:likeable])
		end

		@like = current_user.likes.create(likeable: @object)

		if @like.save
			redirect_back(fallback_location: root_path)
		else
			redirect_to root_path(@post)
		end	
	end

	def destroy
		@like = Like.find_by(likeable: params[:likeable])
		@like.destroy
		redirect_back(fallback_location: root_path)
	end

end
