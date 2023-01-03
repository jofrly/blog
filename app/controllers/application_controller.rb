class ApplicationController < ActionController::Base
  before_action :set_current
  before_action :set_locale

  private

  def set_current
    Current.user = User.find(session[:user_id]) if session[:user_id]
    Current.user ||= Guest.new
  end

  def set_locale
    I18n.locale = :de
  end

  def require_authentication
    return if Current.user.authenticated?

    redirect_to root_path
  end
end
