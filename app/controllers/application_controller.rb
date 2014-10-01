class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale, :set_camera

  private
  def set_locale
    I18n.locale = cookies[:locale] || I18n.default_locale
    cookies[:locale] = I18n.locale
  end

  def set_camera
    session[:id_camera] = 1 if Camera.count != 0 && session[:id_camera].nil?
  end
end
