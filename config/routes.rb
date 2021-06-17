Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  scope module: :public do
    root to:  'homes#top'
    get '/homes/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :cart_items ,only: [ :index,:create,:update,:destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [ :show, :index, :create, :new]
    get '/orders/after' =>  'orders#after'
    post '/orders/confirm' =>  'orders#confirm'
    resource :customers, only: [ :edit, :update]
    get '/customers/my_page' => 'customers#show'
    patch '/customers/withdraw' => 'customers#withdraw'
    get '/customers/change' => 'customers#change'
    resources :addressess ,only: [ :index,:create,:update,:destroy,:edit]
  end

  # 管理者
   get '/admin' => 'admin/homes#top'
  namespace :admin do
    resources :items, only:  [ :index, :new, :create, :show, :update, :edit]
    resources :genres, only:  [ :index, :create, :update, :edit]
    resources :customers, only:  [ :index, :show, :update, :edit]
    resources :orders, only: [:show, :update]
    patch '/order_items/:id' => 'orders_items#update'
  end

end
