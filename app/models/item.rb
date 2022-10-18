class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_bearer_id
    validates :region_id
    validates :delivery_date_id
    validates :price, format: { with:  /\A[0-9]+\z/ },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end
