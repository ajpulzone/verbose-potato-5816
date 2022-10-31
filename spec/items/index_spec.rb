require "rails_helper"

RSpec.describe "Items Index Page", type: :feature do
  
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

  it "when a user visits the items index page, they see a list of all the items including
    te item's name, price, supermarket that item belongs to and a count of customers that
    bought that item" do

      visit "/items"

      save_and_open_page
      
      expect(page).to have_content("Item Name: #{@item_1.name}, Price: #{@item_1.price}, Location: #{@item_1.supermarket[:name]}, Quantity Purchased: #{@item_1.purchase_count(@item_1.id)}")
      expect(page).to have_content("Item Name: #{@item_2.name}, Price: #{@item_2.price}, Location: #{@item_2.supermarket[:name]}, Quantity Purchased: #{@item_2.purchase_count(@item_2.id)}")
      expect(page).to have_content("Item Name: #{@item_3.name}, Price: #{@item_3.price}, Location: #{@item_3.supermarket[:name]}, Quantity Purchased: #{@item_3.purchase_count(@item_3.id)}")
      expect(page).to have_content("Item Name: #{@item_4.name}, Price: #{@item_4.price}, Location: #{@item_4.supermarket[:name]}, Quantity Purchased: #{@item_4.purchase_count(@item_4.id)}")
      expect(page).to have_content("Item Name: #{@item_5.name}, Price: #{@item_5.price}, Location: #{@item_5.supermarket[:name]}, Quantity Purchased: #{@item_5.purchase_count(@item_5.id)}")
      
    end
end