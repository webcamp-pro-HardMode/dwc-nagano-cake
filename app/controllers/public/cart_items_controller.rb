class Public::CartItemsController < ApplicationController
  # カート一覧画面
  def index
    # 現在のカートを呼び出す
    @cart_items = current_cart.cart_items
  end

# カート内注文情報画面/注文作成アクション
  def create
    @cart_item = CartItem.new(item_params)
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
      params.require(:cart_item).permit( :item_id, :count)
    end

end
