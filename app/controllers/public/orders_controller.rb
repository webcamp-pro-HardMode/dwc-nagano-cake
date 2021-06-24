class Public::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def confirm
    # 注文確定（注文情報入力後）
    # binding pry
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]

    # binding.pry
    # ラジオボタンが押下されたとき（０）自分の家に送る
    if params[:order][:address_no] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.family_name + current_customer.first_name
      @order.assign_attributes(order_params)

    # ラジオボタンが押下されたとき（１）登録済みの住所に送る
    elsif params[:order][:address_no] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    # ラジオボタンが押下されたとき（２）新規の宛先に送る
    elsif params[:order][:address_no] == "2"
      @address = Address.new
      @address.customer_id = current_customer.id
      @address.save

      @order.name = @address.name
      @order.postal_code = @address.postal_code
      @order.address =  @address.street_address

    end

    @cart_items = current_customer.cart_items


    # 送料の設定
    @order.shipping_cost = 800



    render "confirm"


  end

  def index
    @orders = current_customer.orders
  end

  def after
  end

  def new
    # 注文情報入力へ
    @order = Order.new
    @customer = current_customer

  end

  def create
    # 注文確定となる
    # binding.pry
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_items = @order.order_items.new
      @order_items.item_id = cart_item.item.id
      @order_items.item.name = cart_item.item.name
      @order_items.price = cart_item.item.price
      @order_items.quantity = cart_item.count
      @order_items.save
    end
    
    @cart_items.destroy_all
    
    redirect_to orders_after_path

  end

  private

	def order_params
		params.permit(:shipping_cost, :postal_code, :address, :name, :payment_method, :total_cost )
	end
#     def order_params
# 		params.require(:order).permit(:postal_code, :address, :name, :payment_method, :shipping_fee, :total_price, :status)
# 	end

end
