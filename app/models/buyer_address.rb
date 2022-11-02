class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :region_id, :city, :house_number, :building_name, :phone, :buyer_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows(e.g. 123-4567)' }
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone, length: { minimum: 10, message: 'is too short' },
                      numericality: { only_integer: true, message: 'is invalid. Input only number' }
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, house_number: house_number,
                   building_name: building_name, phone: phone, buyer_id: buyer.id)
  end
end
