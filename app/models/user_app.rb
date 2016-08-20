=begin
user_id 	integer
app_id 		integer
=end	
class UserApp < ActiveRecord::Base
  belongs_to :user
  belongs_to :app
end
