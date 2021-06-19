Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 顧客
   devise_for :customers

  scope module: :public do
    root to:  'homes#top'
    get '/homes/about' => 'homes#about'
    resources :addressess ,only: [ :index,:create,:update,:destroy,:edit]
    resources :items, only: [:index, :show]
    resources :cart_items ,only: [ :index,:create,:update,:destroy]
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders, only: [ :show, :index, :create, :new]
    get '/orders/after' =>  'orders#after'
    post '/orders/confirm' =>  'orders#confirm'
    resource :customers, only: [ :update]
    get "/customers/my_page/edit", to: 'customers#edit', as: :edit_mypage
    get '/customers/my_page' => 'customers#show'
    patch '/customers/withdraw' => 'customers#withdraw'
    get '/customers/change' => 'customers#change'
  end

  # 管理者
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  get '/admin' => 'admin/homes#top'

  namespace :admin do
    resources :items, only:  [ :index, :new, :create, :show, :update, :edit]
    resources :genres, only:  [ :index, :create, :update, :edit]
    resources :customers, only:  [ :index, :show, :update, :edit]
    resources :orders, only: [:show, :update]
    patch '/order_items/:id' => 'orders_items#update'
  end

end
