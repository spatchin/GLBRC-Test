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

	def add_app(app_name)
		return -1 if app_name.nil?
		app = App.where(name: app_name).first
		return -1 if app.nil? || self.apps.include?(app)
		self.apps << app
		self.user_apps.last.update(name: app.name, description: app.description)
		0
	end

	def remove_app(app_name)
		return -1 if app_name.nil?
		app = App.where(name: app_name).first
		return -1 if app.nil? || !self.apps.include?(app)
		self.apps.destroy(app)
		0
	end
end
