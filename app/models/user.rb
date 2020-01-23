class User < ApplicationRecord
  has_secure_password
  has_one_attached :profile_picture
  attribute :new_profile_picture

  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :boughts, dependent: :destroy
  has_many :items, dependent: :destroy
  
  validates :name, presence: true,
    length: { minimum: 2, maximum: 10, allow_blank: true },
    uniqueness: { case_sensitive: false}

  validates :loginID, presence: true,
    format: { with: /\A[A-Za-z][A-Za-z0-9]*\z/, allow_blank: true },
    length: { minimum: 2, maximum: 10, allow_blank: true },
    uniqueness: { case_sensitive: false }
  
  validates :password, presence: true,
    format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])[a-zA-Z0-9]+\z/, allow_blank: true },
    length: { minimum: 3, maximum: 10, allow_blank: true }

  before_save do
    if new_profile_picture
      self.profile_picture = new_profile_picture
    end
  end

end
