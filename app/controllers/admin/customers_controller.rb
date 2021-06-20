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
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  private

  def customer_params
      params.require(:customer).permit(:first_name, :family_name, :kana_sei, :kama_mei, :email, :postal_code, :address, :phone_number)
  end

end
