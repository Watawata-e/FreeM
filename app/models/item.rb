class Item < ApplicationRecord
  has_many :comments
  has_many :favorite
  has_many :request
  has_many :bought

  belongs_to :user
  belongs_to :status
  belongs_to :category

  validates :name, presence: true, length: { maximum: 20, allow_blank: true }
  validates :value, presence: true,
    numericality: {
      only_integer: true,
      greater_than: 100,
      less_than: 1000000,
      allow_blank: true
    }
  validates :detail, presence: true, length: { maximum: 500, allow_blank: true }
  validates :stock, presence: true, 
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than: 100,
      allow_blank: true
    }



end
