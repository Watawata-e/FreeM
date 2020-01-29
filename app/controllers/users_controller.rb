class UsersController < ApplicationController
  def index
  end

  def show
    @comments = Comment.where(user_id: params[:id]).where.not(administrator_id: nil)
    @user = User.find(params[:id])
    @items = Item.where(user_id: params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render "login/index", notice: "登録しました。"
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to @user, notice: "ユーザー情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :root, notice: "退会しました。"
  end
end
