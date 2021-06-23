class Item < ApplicationRecord
  has_many :notes, dependent: :destroy

  validates :title, :description, presence: true
end
