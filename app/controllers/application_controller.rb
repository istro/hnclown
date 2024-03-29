class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :signed_in?

  def sign_in(user)
    cookies[:remember_token] = {value:   user.remember_token,
                                expires: 2000.years.from_now.utc}
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
