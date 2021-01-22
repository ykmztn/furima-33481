class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id 
    validates :item_status_id 
    validates :shipping_cost_id
    validates :ship_from_id
    validates :shipping_day_id
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1 }  do  
    validates :category_id
  end
  
end