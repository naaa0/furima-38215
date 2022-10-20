class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_bearer
  belongs_to :region
  belongs_to :delivery_date

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id,        numericality: { other_than: 1 , message: "can't be blank"}
    validates :condition_id,       numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_bearer_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :region_id,          numericality: { other_than: 1 , message: "can't be blank"}
    validates :delivery_date_id,   numericality: { other_than: 1 , message: "can't be blank"}
    validates :price, format: { with:  /\A[0-9]+\z/ },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

end
