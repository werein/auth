Core::ApplicationController.class_eval do
  helper ::Auth::ApplicationHelper

  # CanCan Ability, redirect when user have no access
  rescue_from CanCan::AccessDenied do |exception|
    signed_in? ? redirect_back(alert: t('cancan.access_denied')) : redirect_to(auth.root_path, notice: t('cancan.access_denied_not_logged'))
  end

  def xeditable? object
    current_user.xeditable? and can?(:edit, object) if current_user
  end
  helper_method :xeditable?

  def manage?
    current_user.manage? if current_user
  end
  helper_method :manage?
end