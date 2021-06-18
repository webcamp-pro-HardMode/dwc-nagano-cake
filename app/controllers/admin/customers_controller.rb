class Admin::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def index
  end

  def show
    #@customer = current_customer
  end

  def edit
  end

  def update

  end

  private

  def customer_params
      params.require(:customer).permit(:first_name, :family_name, :kana_sei, :kama_mei, :email, :postal_code, :address, :phone_number)
  end


end
