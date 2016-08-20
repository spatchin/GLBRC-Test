=begin
login 				string
password 			string
=end	
class User < ActiveRecord::Base
	has_many :user_apps
	has_many :apps, through: :user_apps

	# validates_presence_of :name
end
