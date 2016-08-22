require 'test_helper'

class UserAppTest < ActiveSupport::TestCase
  test 'creates_relationship' do
  	u = User.create(login: 'user1', password_digest: BCrypt::Password.create('glbrcpass'))
  	a = App.create(name: 'App1', description: 'Application 1', color: 'Red', status: true)
  	u.user_apps.create(app: a)
  	assert_equal 1, u.apps.length
  end
end
