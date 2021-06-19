class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def change
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update
    redirect_to customers_my_page_path
  end

  def withdraw
  end

  private

  def customer_params
      params.require(:customer).permit(:first_name, :family_name, :kana_sei, :kama_mei, :email, :postal_code, :address, :phone_number)
  end

end
