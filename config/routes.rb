Rails.application.routes.draw do
  namespace :admin do
    resources :order_details, only:[:update]
  
    resources :orders, only:[:show, :update]

    resources :customers, only:[:index, :show, :edit, :update]

    resources :genres, only:[:index, :create, :edit, :update]

    resources :items, only:[:new, :index, :edit, :create, :update ,:destroy]

    root to: 'homes#top' 
  end

  scope module: 'public' do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  
    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        post :confirm
        get :thanks
      end
    end
  
    resources :cart_items, only: [:create, :update, :index, :destroy] do
      collection do 
        delete :destroy_all
      end
    end

    controller :customers do
      get "customers/my_page", action: :show
      get "customers/information/edit", action: :edit
      patch "customers/information", action: :update
      get "customers/unsubscribe", action: :unsubscribe
      patch "customers/withdraw", action: :withdraw
    end

    resources :items, only: [:show, :index]
  
    root to: 'homes#top'
    get "/about" => "homes#about", as: "about"
  end

  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
end
