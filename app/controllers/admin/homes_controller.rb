class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all.reverse_order
  end
end
