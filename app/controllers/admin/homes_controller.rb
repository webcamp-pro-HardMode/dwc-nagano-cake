class Admin::HomesController < ApplicationController
  def top
    # binding.pry
    @orders = Order.all.reverse_order
  end
end
