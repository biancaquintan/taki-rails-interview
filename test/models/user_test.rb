require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "valid user register" do
  	assert User.new(email: 'test@taki.com', password: '000000', password_confirmation: '000000', first_name: 'John', last_name: 'Test').save
  end

  test "valid user without first name" do
  	assert_not User.new(email: 'test@taki.com', password: '000000', password_confirmation: '000000', last_name: 'Test').save
  end

  test "valid user without last name" do
  	assert_not User.new(email: 'test@taki.com', password: '000000', password_confirmation: '000000', first_name: 'John').save
  end

  test "valid user without email" do
  	assert_not User.new(password: '000000', password_confirmation: '000000', first_name: 'John', last_name: 'Test').save
  end

  test "valid user without password" do
  	assert_not User.new(email: 'test@taki.com', password_confirmation: '000000', first_name: 'John', last_name: 'Test').save
  end

end
