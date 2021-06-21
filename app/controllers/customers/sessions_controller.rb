# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # createアクション実行時にreject_inactive_customerが起動
  before_action :reject_inactive_customer, only:[:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # 登録していない（退会済み）顧客を拒否する
  def reject_inactive_customer
    customer = Customer.find_by(email: params[:customer][:email])
    if customer
      # 入力されたパスワードが正しいことを確認、さらにcustomerモデルに記述したactive_for_authentication?メソッドがfalseであるかどうかを確認
      if (customer.valid_password?(params[:customer][:password]) && (customer.active_for_authentication? == false))
        # ログインページへリダイレクト、エラーメッセージの表示
        flash[:notice] = '退会済みです'
        redirect_to new_customer_session_path
      else
        # ログインページでのエラーメッセージ
      flash.now[:alert] = "必須項目を入力してください。"
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
