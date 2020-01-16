class FavoritesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @favorites = Favorite.where(user_id: params[:user_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @favorite = Favorite.new(user_id: params[:user_id], item_id: params[:item_id])
    if @favorite.save
      redirect_to @item, notice: "お気に入り登録しました。"
    else
      redirect_to @item, notice: "エラーが発生しました。"
    end
  end

  def destroy
    @favorite = Favorite.where(user_id: params[:user_id], item_id: params[:item_id]).first
    @favorite.destroy
    redirect_to Item.find(params[:item_id]), notice: "お気に入り解除しました"
  end
end
