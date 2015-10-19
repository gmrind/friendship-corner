class UsersController < ApplicationController
	
	def index
	  @users = User.all
	  @user = current_user
	end

	def show
	  @user = current_user
	  @user = User.find(params[:id])
	end

	def new
	  @user = User.new
	end

	def friends
		@user = current_user
	end

	def requests
		@user = current_user
	end
end
