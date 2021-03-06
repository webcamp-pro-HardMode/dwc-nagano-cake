class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to my_page_path, notice: '会員情報を更新しました。'
    else
      render :edit
    end
  end

  #退会確認画面
  def change
    @customer = current_customer
  end

  #退会機能
  def withdraw
    @customer = current_customer
    #trueで更新する（true：退会、false：有効）
    @customer.update(is_exist: true)
    #sessionメソッドでログイン時の情報をリセット（メール・パスワード）、ログアウトさせる
    #application_controllerに定義する
    reset_session
    redirect_to root_path, notice: 'ありがとうございました。またのご利用を心よりお待ちしております。'
  end

  private

  def customer_params
      params.require(:customer).permit(:family_name, :first_name, :kana_sei, :kana_mei, :postal_code, :address, :phone_number, :is_exist, :email)
  end

end
