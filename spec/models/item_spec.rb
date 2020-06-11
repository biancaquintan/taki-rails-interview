require 'rails_helper'

RSpec.describe Item, type: :model do
  context "Validate item" do
    it "Item valid?" do
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
      business.save

      item = Item.new
      item.name = "Americano"
      item.price = 15000
      item.business_id = business.id

      expect(item.valid?).to be_truthy
    end

    it "Item invalid?" do
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
      business.save

      item = Item.new
      item.name = "Americano"
      item.price = 15000
      item.business_id = nil

      expect(item.valid?).to be_falsey
    end

  end
end