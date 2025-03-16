class BuyInformation
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :place_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id 
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter as 123-4567"}
    validates :place_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city 
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Enter only numbers (10-11 digits)' }
    validates :token
  end

  def save
    return false unless valid?

    buy = Buy.create(user_id: user_id, item_id: item_id)
    information = Information.create(buy_id: buy.id, postal_code: postal_code, place_id: place_id, city: city, address: address, building: building, phone_number: phone_number)
  end
    
end

