class Item < ActiveRecord::Base
  belongs_to :business

  with_options presence: true do
    validates :name
    validates :price
    validates :business_id
  end
end
