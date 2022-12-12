class ApplicationController < ActionController::Base
  before_action :set_current

  private

  def set_current
    return unless session[:user_id]

    Current.user = User.find(session[:user_id])
  end
end
