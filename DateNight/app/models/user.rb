
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :date_idea_user
  has_many :date_ideas, through: "date_idea_user"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  	def self.from_omniauth(auth)
  		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    		user.email = auth.info.email
    		user.password = Devise.friendly_token[0,20]
    		user.first_name = auth.info.first_name 
    		user.last_name = auth.info.last_name 
    		user.oauth_token = auth.credentials.token
    		user.oauth_expires_at = Time.at(auth.credentials.expires_at) # assuming the user model has a name
    		user.image_file = auth.info.image # assuming the user model has an image
 		 end
	end
	def link_account_from_omniauth(auth)
  		self.provider = auth.provider
  		self.uid = auth.uid
  		self.first_name = auth.info.first_name 
    	self.last_name = auth.info.last_name 
    	self.image_file = auth.info.image
  		self.save
	end
end
