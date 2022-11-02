require "rails_helper"

RSpec.describe "Supermarket Show Page", type: :feature do

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
    @customer_item_5 = CustomerItem.create!(customer: @customer_2, item: @item_4)
    @customer_item_6 = CustomerItem.create!(customer: @customer_3, item: @item_5)
    @customer_item_7 = CustomerItem.create!(customer: @customer_3, item: @item_2)
    @customer_item_8 = CustomerItem.create!(customer: @customer_3, item: @item_3)
  end

  it "the show page for the specified supermarket should have a unique list of all customers
    that have shopped at the supermarket" do
      customer_item_9 = CustomerItem.create!(customer: @customer_3, item: @item_1)
      customer_4 = Customer.create!(name: "Peter Remington")


      visit "supermarkets/#{@supermarket_1.id}"

      within("#supermarket-#{@supermarket_1.id}") do
        expect(page).to have_content(@customer_1.name, count: 1)
        expect(page).to have_content(@customer_2.name, count: 1)
        expect(page).to have_content(@customer_3.name, count: 1)
        expect(page).to have_no_content(customer_4.name)
      end
  end
end