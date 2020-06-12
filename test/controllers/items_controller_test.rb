require 'test_helper'

class ItemsControllerTest < ActionController::TestCase

  setup do
    @item = items(:one)
    @business = businesses(:one)
    request.host = "locahost:3000"
  end

  test "should get list" do
  	get :index
  	assert_redirected_to "/login"
  end

  test "should get list with session" do
    log_in users(:one)
  	get "index"
  	assert_redirected_to new_business_path
  end

  test "should get new" do
    log_in users(:one)
    get :new
    assert_response :success
  end

  test "should create item" do
    log_in users(:one)
    assert_difference('Item.count') do
      post :create, item: { name: 'Pão', price: 10.0, business_id: @business.id }
    end
    assert_redirected_to items_path
  end

  test "should edit item" do
    log_in users(:one)
    get :edit, id: @item.id
    assert_response :success
  end

  test "should destroy item" do
    log_in users(:one)
    assert_difference('Item.count', -1, 'An Item should be destroyed') do
      delete :destroy, id: @item.id
    end
  end
end
