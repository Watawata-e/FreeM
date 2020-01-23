class SessionsController < ApplicationController
  def create
    user = User.find_by(loginID: params[:loginID])
    admin = Administrator.find_by(loginID: params[:loginID])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root
    elsif admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to :admin_root
    else
      flash.alert = "ログインIDとパスワードが一致しません"
      redirect_to controller: :login, action: :index
    end
  end

  def destroy
    if session[:user_id]
      session.delete(:user_id)
    elsif session[:admin_id]
      session.delete(:admin_id)
    end
    redirect_to :root
  end
end
