class Admin::OrderItemsController < ApplicationController
   before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_item.update(order_item_params)
    if @order_item.order_status == "製作不可"
        @order.update(status: "入金待ち")
    elsif @order_item.order_status == "製作待ち"
        @order.update(status: "入金確認")
    elsif @order_item.order_status == "製作中"
       @order.update(status: "製作中")
    elsif @order_item.order_status == "製作完了"
       @order.update(status: "発送準備中")
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def order_item_params
     params.require(:order_item).permit(:order_status)
  end
end
