class Public::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def cofirm
    # 注文確定（注文情報入力後）
    @order = Order.new(order_params)
    
  end

  def index
    @orders = Order.find(params[:id])
  end

  def after
  end

  def new
    # 注文情報入力へ
    @order = Order.new
  end

  def create
    # 注文確定となる
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_after_path
  end

  private

	 def order_params
		params.require(:order).permit(
    :shipping_cost,
    :postal_code,
    :address,
    :name,
    :payment_method,
    :status,
    :total_cost,
    )end

end
