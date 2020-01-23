class Item < ApplicationRecord
  has_one_attached :item_picture
  attribute :new_item_picture

  has_many :comments, dependent: :destroy
  has_many :favorite, dependent: :destroy
  has_many :request, dependent: :destroy
  has_many :bought, dependent: :destroy

  belongs_to :user
  belongs_to :status
  belongs_to :category

  validates :name, presence: true, length: { maximum: 20, allow_blank: true }
  validates :value, presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 100,
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

  class << self
    def search(name, category)
      rel = order("id")
      if name.present?
        if category == "0"
          rel = rel.where("name LIKE ?", "%#{name}%")
        else
          rel = rel.where("name LIKE ? AND category_id LIKE ?", "%#{name}%", "#{category}")
        end
      else
        if category != "0"
          rel = rel.where("category_id LIKE ?", "#{category}")
        end
      end
      rel
    end
  end

  before_save do
    if new_item_picture
      self.item_picture = new_item_picture
    end
  end

end
