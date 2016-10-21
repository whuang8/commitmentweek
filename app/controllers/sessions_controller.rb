class SessionsController < ApplicationController
	def create
		
	end

	def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
