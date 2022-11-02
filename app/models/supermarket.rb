class Supermarket < ApplicationRecord
  has_many :items
  #you can also add relationships (if they exist) to make the data obtainment easier
  has_many :customers, through: :items

  def unique_customers
    #if we wanted to write active record only we would need to create a join table
    #this is a good candidate for a joins statement
    # -->   Customer.joins(:items, :customer_items).select("customers.id, customers.name").where("items.supermarket_id = #{self.id}").distinct
    #Use above if no additional relationships are created

    #IF additional relationships are created (as above, below "has_many :items"), all you need is below
    customers.distinct
  end
end