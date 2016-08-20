=begin
login 				string
password 			string
=end	
class User < ActiveRecord::Base
	has_many :user_apps
	has_many :apps, through: :user_apps

	has_secure_password

	# validates_presence_of :name
	def add_default_apps
		App.all.each { |a| self.apps << a if a.status }
	end
end
