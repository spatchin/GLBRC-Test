=begin
name 				string
description string
color 			string
status 			bool
=end	
end
class App < ActiveRecord::Base
	has_many :user_apps
	has_many :users, through: :user_apps

	validates
end
