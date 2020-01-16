class BoughtsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @boughts = @user.boughts
    end
  end

  def create
    @item = Item.find(params[:item])
    @number = params[:number]
    @bought = Bought.new(user_id: current_user.id, item_id: params[:item], number: params[:number])
    @item.stock = @item.stock - @number.to_i
    if @bought.save && @item.save
      redirect_to @item, notice: "商品を購入しました。"
    else
      redirect_to :root, notice: "エラーが発生しました。"
    end
  end

  def update
    @bought = Bought.find(params[:bought_id])
    @bought.assign_attributes(user_id: params[:user_id], item_id: params[:item_id], review: params[:review], number: params[:number])
    @user = User.find(params[:user_id])
    if @bought.save
      redirect_to [@user, :boughts], notice: "取引が完了しました。"
    else
      redirect_to [@user, :boughts], notice: "エラーが発生しました。"
    end 
  end
end
