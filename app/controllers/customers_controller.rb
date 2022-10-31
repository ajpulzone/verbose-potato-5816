class CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    # binding.pry
  end

end