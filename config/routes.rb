Auth::Engine.routes.draw do

  scope '(:locale)', locale: Regexp.new(I18n.available_locales.join("|"))  do
    authenticated do
      root to: 'dashboard#authenticated', as: :authenticated
    end
    root to: 'dashboard#index'
  end

  devise_scope :user do 
    providers = Regexp.union(Devise.omniauth_providers.map(&:to_s))
    get 'users/auth/:action/callback', constraints: { action: providers }, to: 'omniauth_callbacks', as: :omniauth_callback
  end

  localized do 
    devise_for  :users, class_name: 'Auth::User', module: :devise, 
                controllers: { omniauth_callbacks: 'auth/omniauth_callbacks' },
                path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

    resources :users, except: [:create, :index] do
      get :switch, on: :collection
    end
  end
end