class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = 0
    @order_items.each do |order_item| 
      @total += (order_item.item.price * 1.1).round(-1) * order_item.quantity
    end
    # binding.pry
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def order_params
     params.require(:order).permit(:status)
  end
end
