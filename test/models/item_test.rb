require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "valid Item register" do
  	assert Item.new(name: 'Item 1', price: 10.0, business_id: 1).save
  end

  test "valid Item without name" do
  	assert_not Item.new(price: 10.0, business_id: 1).save
  end

  test "valid Item without price" do
  	assert_not Item.new(name: 'Item 1', business_id: 1).save
  end

  test "valid Item without business id" do
  	assert_not Item.new(name: 'Item 1', price: 10.0).save
  end

end
