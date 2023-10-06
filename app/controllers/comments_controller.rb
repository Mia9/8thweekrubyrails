class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = current_user.comments.create(comment_params.merge(post_id: @post.id))
		if @comment.save
			redirect_to post_path(@post)
		else
			redirect_to root_path
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	def comment_params
		params.require(:comment).permit(:content)
	end

end
