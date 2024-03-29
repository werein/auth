module Auth
  class ApplicationController < ::ApplicationController

    # Current user ability
    def current_ability
      @current_ability ||= Auth::Ability.new current_user
    end
  end
end