require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
  end

   before(:each) do
    @supermarket_1 = Supermarket.create!(name: "Cody's Goods", location: "344 Lancaster St")
    @supermarket_2 = Supermarket.create!(name: "Safeway", location: "222 Shiner Ct")
    @item_1 = @supermarket_1.items.create!(name: "Bananas", price: 2)
    @item_2 = @supermarket_2.items.create!(name: "Shrimp", price: 18)
    @item_3 = @supermarket_2.items.create!(name: "Crackers", price: 4)
    @item_4 = @supermarket_2.items.create!(name: "Pasta", price: 3)
    @item_5 = @supermarket_1.items.create!(name: "Salmon", price: 25)
    @customer_1 = Customer.create!(name: "Hudson Brand")
    @customer_2 = Customer.create!(name: "Sawyer Ludmer")
    @customer_3 = Customer.create!(name: "Leslie Winkle")
    @customer_item_1 = CustomerItem.create!(customer: @customer_1, item: @item_1)
    @customer_item_2 = CustomerItem.create!(customer: @customer_1, item: @item_2)
    @customer_item_3 = CustomerItem.create!(customer: @customer_1, item: @item_3)
    @customer_item_4 = CustomerItem.create!(customer: @customer_2, item: @item_1)
    @customer_item_4 = CustomerItem.create!(customer: @customer_2, item: @item_4)
    @customer_item_5 = CustomerItem.create!(customer: @customer_3, item: @item_5)
    @customer_item_5 = CustomerItem.create!(customer: @customer_3, item: @item_2)
    @customer_item_5 = CustomerItem.create!(customer: @customer_3, item: @item_3)
  end

  describe "#purchase count" do
    it "should give the count of how many customers purchased the item" do
      expect(@item_1.purchase_count(@item_1.id)).to eq(2)
      expect(@item_2.purchase_count(@item_2.id)).to eq(2)
      expect(@item_4.purchase_count(@item_4.id)).to_not eq(2)
    end
  end 
end
