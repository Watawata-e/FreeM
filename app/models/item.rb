class Item < ApplicationRecord
  has_many :comments
  has_many :favorite
  has_many :request
  has_many :bought

  belongs_to :user
  belongs_to :status
  belongs_to :category

end
