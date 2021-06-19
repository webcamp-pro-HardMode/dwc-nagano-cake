class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #ログイン後の遷移先
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      orders_path
    when Customer
      customers_my_page_path
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


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :first_name, :kana_sei, :kana_mei, :postal_code, :address, :phone_number])
  end


end
