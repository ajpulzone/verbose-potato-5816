class Customer < ApplicationRecord

  has_many :items
  has_many :items, through: :customer_items
end