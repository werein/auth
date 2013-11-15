require_dependency "auth/application_controller"

module Auth
  class DashboardController < ApplicationController
    before_action :set_title
    respond_to :html, :json

    def index ; end

    def authenticated
      @user = current_user
      respond_with @user
    end

    private
      def set_title
        set_meta_tags title: t('.title')
      end
  end
end