class Note < ApplicationRecord
  belongs_to :item

  validates :body, presence: true
end
