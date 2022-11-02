class SupermarketsController < ApplicationController

  def show
    @supermarket = Supermarket.find(params[:supermarket_id])

  end
end