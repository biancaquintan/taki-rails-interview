require 'rails_helper'

RSpec.describe Business, type: :model do
  context "Validate business" do
    it "Business valid?" do
      user = User.new
      user.first_name = "Guilherme"
      user.last_name = "Reis"
      user.email = "guilhermereis@gmail.com"
      user.password = "123123"
      user.password_confirmation = "123123"
      user.save

      business = Business.new
      business.name = "JJ Cafe"
      business.address = "JL Gatot Subroto 25F"
      business.city = "Jakarta Pusat"
      business.user_id = user.id

      expect(business.valid?).to be_truthy
    end

    it "Business invalid?" do
      user = User.new
      user.first_name = "Guilherme"
      user.last_name = "Reis"
      user.email = "guilhermereis@gmail.com"
      user.password = "123123"
      user.password_confirmation = "123123"
      user.save

      business = Business.new
      business.name = nil
      business.address = nil
      business.city = nil
      business.user_id = nil

      expect(business.valid?).to be_falsey
    end

  end
end