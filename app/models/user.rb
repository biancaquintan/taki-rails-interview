class User < ActiveRecord::Base

  has_secure_password

  has_one :business

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :email
  end
end
