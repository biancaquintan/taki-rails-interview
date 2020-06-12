class Item < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  validates :business_id, presence: true
  
  belongs_to :business
end
