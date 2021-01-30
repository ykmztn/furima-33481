class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :purchase_id,
                :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :city
    validates :house_number
    validates :phone_number
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/n }

  validates :phone_number, numericality: { only_integer: true }, length: { maximum: 11 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
