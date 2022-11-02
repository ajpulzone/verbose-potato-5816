class CustomerItemsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @customer = Customer.find(params[:customer_id])
    if @item.present?
      @customer_item = CustomerItem.create!(customer: @customer, item: @item)
      redirect_to "/customers/#{@customer.id}"
    end
  end
end