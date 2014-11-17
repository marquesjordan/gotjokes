class ProfilesController < ApplicationController

	def index
		@profiles = Profile.all
	end

	def show
		@profile = User.find(params[:id])
	end

	def edit
		
	end

	def update
		
	end

	def destroy

	end 
end
