require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get new" do
  	get "new"
  	assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: 'john@taki.com', password: '000000', password_confirmation: '000000', first_name: 'John', last_name: 'Doe' }
    end
    assert_redirected_to root_url
  end

end
