Core::ApplicationController.class_eval do

  # CanCan Ability, redirect when user have no access
  rescue_from CanCan::AccessDenied do |exception|
    redirect_back alert: exception.message
  end

  def xeditable?
    current_user.xeditable? if current_user
  end
  helper_method :xeditable?

  def manage?
    current_user.manage? if current_user
  end
  helper_method :manage?
end