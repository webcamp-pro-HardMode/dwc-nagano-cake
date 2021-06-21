class Public::AddressesController < ApplicationController

  def index
    # @address = Address.new
    # @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
  end

  def update
  end

end
