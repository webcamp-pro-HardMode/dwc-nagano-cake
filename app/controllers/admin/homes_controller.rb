class Admin::HomesController < ApplicationController
before_action :authenticate_admin!

  def top
    @orders = Order.all.reverse_order
  end
end
