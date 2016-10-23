class UsersController < ApplicationController
	def show
		user = User.find_by(uid: params[:id])
		response = HTTParty.get "https://api.github.com/users/#{user.username}/events/public"
		
		events = JSON.parse(response.body)
		
		events.each do |event|
			if event["type"] == "PushEvent"
				puts '----'
				event["payload"]["commits"].each do |commit|
					puts commit["message"]
				end
			end
		end		

		render plain: events
	end

end
