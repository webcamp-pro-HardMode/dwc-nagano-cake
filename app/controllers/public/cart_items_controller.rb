class Public::CartItemsController < ApplicationController
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_customer!
  # ストロングパラメーター内で定義しています
  # before_action :set_cart_item
  # before_action :set_customer


  # カート一覧画面
  def index
  #現在のカートを呼び出す
  # @cart_items = @customer.cart_items
  end

# カート内注文情報画面/注文作成アクション
  def create
    # buildはnewの別名のメソッドでitem_idなどの関連付けられたものを作成するときに使用する
    @cart_item = CartItem.new(cart_item_params)
    @customer = current_customer
    @cart_item = @customer.cart_items.build(item_id: params[:item_id])
    # もし空白のとき:blank?メソッドは、オブジェクトが空白の場合はtrueを返し、オブジェクトが空白ではない場合はfalseを返すメソッドです。
    # if @cart_item.blank?
    #   @cart_item.count += params[:count].to_i
    #   if

        @cart_item.save
        redirect_to cart_items_path
      # else
        # redirect_to cart_items_path
      # end
    # end
  end

# カート内商品データ更新
  def update
    # find_byは、複数の条件を指定したりid以外のカラムでも検索できる
    # CartItemテーブルから「IDカラム」がボタン押下時等に得られる「paramsID」とマッチした最初のデータを取得する、それをUPDATEする
    CartItem.find_by(id: params[:id]).update(cart_item_params)
    redirect_to cart_items_path
  end

# カート内商品削除
  def destroy
    # CartItemテーブルから「idカラム」がボタン押下時等に得られる「取得したID（paramus:id）」とマッチするデータを取得し、削除する
    CartItem.find_by(id: params[:id]).destroy
    redirect_to cart_items_path

  end

# カート内全商品削除
   def destroy_all
     # 現在のカートを呼び出す
    @cart_items = current_cart.cart_items.destroy_all
    #destroy_allメソッドを使い現在のカートのレコード全てを削除
    @cart_items.destroy_all
    redirect_to cart_items_path
   end


private
    def cart_item_params
      # カートアイテムテーブルへ、商品のidと数量を保存する
      params.require(:cart_item).permit( :item_id, :count, :customer_id)
    end


    # before_actionでの記述に対しての定義
    def set_customer
      @customer = current_customer
    end

    def set_cart_item
      @cart_item = current_customer.cart_item.find_by(item_id: params[:item_id])
    end
end
