class Item < ApplicationRecord
  belongs_to :supermarket

  has_many :customer_items
  has_many :customers, through: :customer_items

  def purchase_count(id_of_item)
    @purchased = CustomerItem.where(item_id: id_of_item).count
  end
end