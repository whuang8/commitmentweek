class User < ApplicationRecord
	def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.username = auth["extra"]["raw_info"]["login"]
      user.image = auth["info"]["image"]
    end
  end
end
