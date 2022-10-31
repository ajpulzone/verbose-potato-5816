class Item < ApplicationRecord
  belongs_to :supermarket

  has_many :customers
  has_many :customers, through: :customer_items
end