require "rails_helper"

RSpec.describe "Customer Show Page", type: :feature do

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

  it "on the show page of the specified customer, the user sees the customersname" do

    visit "customers/#{@customer_1.id}"

    within("#customer-#{@customer_1.id}") do
    expect(page).to have_content("Name: Hudson Brand")
    end 
  end

  it "the show page of the specified customer shows a list of the customers items, including
    the item's name, price and the name of the supermarket that it belongs to." do

      visit "customers/#{@customer_1.id}"

      within("#customer-#{@customer_1.id}") do
      expect(page).to have_content("Item Name: Bananas, Cost: 2, Location: Cody's Goods")
      expect(page).to have_content("Item Name: Shrimp, Cost: 18, Location: Safeway")
      expect(page).to have_content("Item Name: Crackers, Cost: 4, Location: Safeway")
      expect(page).to have_no_content("Item Name: Salmon, Cost: 25, Location: Cody's Goods")
      end
  end
end