require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validate user" do
    it "User valid?" do
      user = User.new
      user.first_name = "Guilherme"
      user.last_name = "Reis"
      user.email = "guilhermereis@gmail.com"
      user.password = "123123"
      user.password_confirmation = "123123"

      expect(user.valid?).to be_truthy
    end

    it "User invalid?" do
      user = User.new
      user.first_name = nil
      user.last_name = nil
      user.email = nil
      user.password = nil
      user.password_confirmation = nil

      expect(user.valid?).to be_falsey
    end

  end
end
