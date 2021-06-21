class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # deviseにまつわる画面に行った時に全ての画面でconfigure_permitted_parametersが起動
  before_action :configure_permitted_parameters , if: :devise_controller?

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

  # 新規登録・顧客情報更新時に（deviseのデフォルト以外の）カラムの保存を許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :kana_sei, :kana_mei, :postal_code, :address, :phone_number, :is_exist])
  end

end
