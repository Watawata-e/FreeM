class User < ApplicationRecord
  has_secure_password

  has_many :comments
  has_many :favorites
  has_many :requests
  has_many :boughts
  has_many :items

end
