require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    user = User.create(login: 'user1', password_digest: BCrypt::Password.create('glbrcpass'))
    get :create, session: { login: 'user1', password: 'glbrcpass' }
    assert_redirected_to '/'
    user.destroy
  end

  test "should get destroy" do
    get :destroy
    assert_redirected_to '/'
  end

end
