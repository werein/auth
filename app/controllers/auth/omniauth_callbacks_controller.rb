module Auth
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def all
      identity = Identity.from_omniauth request.env['omniauth.auth'], current_user
      if identity.user.persisted?
        sign_in :user, identity.user
        redirect_to root_path, notice: 'Signed in'
      else
        redirect_to root_path, notice: 'Failed'
      end
    end
    alias_method :twitter, :all
    alias_method :facebook, :all
  end
end