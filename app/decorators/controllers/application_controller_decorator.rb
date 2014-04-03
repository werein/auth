::ApplicationController.class_eval do

  rescue_from CanCan::AccessDenied do |exception|
    if signed_in?
      redirect :back, alert: t('auth.cancan.unauthorized')
    else
      redirect_to auth.root_path, notice: t('auth.cancan.authorize')
    end
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