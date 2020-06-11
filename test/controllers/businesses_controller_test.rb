require 'test_helper'

class BusinessesControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    request.host = "locahost:3000"
  end

  test "should create business" do
    log_in users(:one)
    assert_difference('Business.count') do
      post :create, business: { name: 'JJ Cafe', address: 'JL Gatot Subroto 25F', city: 'Jakarta Pusat', user_id: @user.id }
    end
    assert_redirected_to root_url
  end

  test "valid create business withou name" do
    log_in users(:one)
    assert_no_difference('Business.count') do
      post :create, business: { address: 'JL Gatot Subroto 25F', city: 'Jakarta Pusat', user_id: @user.id }
    end
  end

end
