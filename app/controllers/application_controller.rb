class ApplicationController < ActionController::Base
  private def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  private def current_admin
    Administrator.find_by(id: session[:admin_id]) if session[:admin_id]
  end
  helper_method :current_admin

  class LoginRequired < StandardError; end
  class Forbidden < StandardError; end

  private def login_required
    raise LoginRequired unless current_user
  end
end
