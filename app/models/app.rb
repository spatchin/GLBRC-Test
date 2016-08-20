=begin
name 					string
description 	string
color 				string
status 				bool
=end	
class App < ActiveRecord::Base
	has_many :user_apps
	has_many :users, through: :user_apps

	# validates :name, :description, :color, :status, presence: true
end
