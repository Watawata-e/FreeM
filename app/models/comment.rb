class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item, optional: true
  belongs_to :administrator, optional: true

  validates :sentence, presence: true,
    length: { maximum: 100, allow_blank: true }
end
