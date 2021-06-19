class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_items
  belongs_to :genre, optional: true
  attachment :image

  validates :name, presence: true
  validates :price, presence: true
  validates :introduction, presence: true
  validates :is_status, inclusion: { in: [true, false]}
end
