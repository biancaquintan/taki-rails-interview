require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "valid Business register" do
  	assert Business.new(name: 'Business 1', address: 'Rua x, Bairro Tal, num 10', city: 'Formosa', user_id: 1).save
  end

  test "valid Business without name" do
  	assert_not Business.new(address: 'Rua x, Bairro Tal, num 10', city: 'Formosa', user_id: 1).save
  end

  test "valid Business without address" do
  	assert Business.new(name: 'Business 1', city: 'Formosa', user_id: 1).save
  end

  test "valid Business without city" do
  	assert Business.new(name: 'Business 1', address: 'Rua x, Bairro Tal, num 10', user_id: 1).save
  end

  test "valid Business without user id" do
  	assert_not Business.new(name: 'Business 1', address: 'Rua x, Bairro Tal, num 10', city: 'Formosa').save
  end

end
