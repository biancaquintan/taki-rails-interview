class Business < ActiveRecord::Base
  belongs_to :user

  has_many :items

  with_options presence: true do
    validates :name
    validates :address
    validates :city
    validates :user_id
  end
end
