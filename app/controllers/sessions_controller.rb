class SessionsController < ApplicationController
  def create
    user = User.find_by(loginID: params[:loginID])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root
    else
      flash.alert = "ログインIDとパスワードが一致しません"
      redirect_to controller: :login, action: :index
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to :root
  end
end
