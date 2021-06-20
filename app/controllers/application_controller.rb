class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_sign_up_params, only: [:create]
  #before_action :reject_inactive_customer, only:[:new, :create]

  #ログイン後の遷移先
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      orders_path
    when Customer
      my_page_path
    end
  end

  #ログアウト後の遷移先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
       new_admin_session_path
    else
       root_path
    end
  end





  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :family_name, :first_name, :kana_sei, :kana_mei, :postcode, :prefecture_name, :address_city, :address_street, :address_building, :postal_code, :address, :phone_number])
  end

  #退会したエンドユーザーのログインを阻止する
  def reject_inactive_customr
    @customer = Customer.find_by(name: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && !@customer.is_valid
        redirect_to new_customer_session_path
      end
    end
  end

    #セッションの作成（カートで使用）
  def current_customer
    # セッションを管理するためにcustomer_idを使用する（誰の注文をカートに入れておくかを記録し続けるため
    # セッションから取得したcart_idを元にCustomerテーブルからcustomer情報を取得
    current_customer = Customer.find_by(id: session[:customer_id])
    # customer情報が存在しない場合、@customerを作成
    current_customer = Customer.create unless current_customer
    # 取得したCustomer情報よりIDを取得し、セッションに設定
    session[:customer_id] = current_customer.id
    # Customerの情報を返却
    current_customer
  end


end
