class ApplicationController < ActionController::Base
  before_action :set_current
  before_action :set_locale

  private

  def set_current
    return unless session[:user_id]

    Current.user = User.find(session[:user_id])
  end

  def set_locale
    I18n.locale = :de
  end

  def require_login
    return if Current.user.present?

    redirect_to root_path
  end
end
