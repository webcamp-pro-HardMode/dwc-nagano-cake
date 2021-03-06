class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = 0
    @order_items.each do |order_item|
      @total += (order_item.item.price * 1.1).round(0) * order_item.quantity
    end
    # binding.pry
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    p "@order.status=" + @order.status
    if @order.status == "入金確認"
      p "if内の処理が実行されました"
      @order_items.each do |order_item|
      order_item.update( order_status: "製作待ち")
      end
    end
    @order.update(order_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def order_params
     params.require(:order).permit(:status)
  end

end
