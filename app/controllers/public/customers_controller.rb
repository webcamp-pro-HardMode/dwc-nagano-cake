class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to my_page_path
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
    #sessionメソッドでログイン時の情報を削除（メール・パスワード）、ログアウトさせる
    #application_controllerに定義する
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private

  def customer_params
      params.require(:customer).permit(:first_name, :family_name, :kana_sei, :kama_mei, :email, :postal_code, :address, :phone_number)
  end

end
