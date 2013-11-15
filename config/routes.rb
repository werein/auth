Auth::Engine.routes.draw do

  scope '(:locale)', locale: Regexp.new(I18n.available_locales.join("|"))  do
    authenticated do
      root to: 'dashboard#authenticated', as: :authenticated
    end
    root to: 'dashboard#index'
  end

  localized do 
    
    devise_scope :user do 
      providers = Regexp.union(Devise.omniauth_providers.map(&:to_s))
      match 'users/auth/:provider', 
        constraints: { provider: providers },
        to: 'omniauth_callbacks#passthru', 
        as: :omniauth_authorize, 
        via: [:get, :post]

      match 'users/auth/:action/callback', 
        constraints: { action: providers },
        to: 'omniauth_callbacks', 
        as: :omniauth_callback, 
        via: [:get, :post]
    end

    devise_for  :users, class_name: 'Auth::User', module: :devise,
                path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

    resources :users, except: [:create, :index] do
      get :switch, on: :collection
    end
  end
end