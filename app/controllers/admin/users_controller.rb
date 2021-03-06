class Admin::UsersController < Admin::Base
  def index
    @users = User.order("id")
  end

  def show
    @comments = Comment.where(user_id: params[:id]).where.not(administrator_id: nil)
    @user = User.find(params[:id])
    @items = Item.where(user_id: params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @user.destroy
    redirect_to :admin_users, notice: @user.name + " さんを退会させました。"
  end
end
