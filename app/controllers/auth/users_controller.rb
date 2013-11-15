require_dependency "auth/application_controller"

module Auth
  class UsersController < ApplicationController
    load_and_authorize_resource
    before_action :set_user, only: [:show, :edit, :update, :destroy] 
    before_action :set_title, only: [:new, :edit]
    respond_to :html, :json

    def show
      set_meta_tags title:        @user.name,
                    description:  @user.name,
                    keywords:     @user.name
      respond_with @user
    end

    def edit
    end

    def update
      flash[:notice] = t('.notice') if @user.update(user_params)
      respond_with @user
    end

    def destroy
      @user.destroy
      redirect_to users_path, notice: t('.notice')
    end

    def switch
      current_user.switch params[:what]
      redirect_back
    end

    private
      def set_user
        @user = User.find(params[:id])
      end

      def set_title
        set_meta_tags title: t('.title')
      end

      def user_params
        params.require(:user).permit(:name, :avatar)
      end
  end
end