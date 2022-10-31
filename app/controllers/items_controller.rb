class ItemsController < ApplicationController

  def index
    @items = Item.all
    @customer_items = CustomerItem.all
    # binding.pry
  end
end