class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def follow
		@user = User.find(params[:id])
		current_user.following_users.create(followee_id: @user.id)
		redirect_to user_path(@user)
	end

	def unfollow
		@user = User.find(params[:id])
		current_user.following_users.find_by(followee_id: @user.id).destroy
		redirect_to user_path(@user)	
	end

	
end