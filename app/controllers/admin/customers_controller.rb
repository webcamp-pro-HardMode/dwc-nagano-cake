class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.all.page(params[:page])
  end

  def show
    #条件に合致するオブジェクトを配列として取り出しeach文に渡すためwhereメソッドを使用
    @customer = Customer.where(id: params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customers_path, notice: '会員情報を更新しました。'
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      render :edit
    end
  end

  private

  def customer_params
      params.require(:customer).permit(:first_name, :family_name, :kana_sei, :kana_mei, :email, :postal_code, :address, :phone_number, :is_exist)
  end

end
