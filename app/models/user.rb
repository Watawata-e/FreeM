class User < ApplicationRecord
  has_secure_password

  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :boughts
  has_many :items, dependent: :destroy

end
