class SessionController < ApplicationController
	def new
	end
	def create
		ninja = Ninja.find_by_name(params[:name])
		if ninja && ninja.authenticate(params[:password])
			session[:user_id] = ninja.id
			redirect_to ninjas_path
		else 
			render :new
		end
	end
	def destroy
		session[:user_id] = nil
		redirect_to login_path
	end
end