class RequestsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @requests = Request.where(user_id: params[:user_id])
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @request = Request.new(item_id: params[:item_id], user_id: current_user.id ,number: params[:number])
    if @request.save
      redirect_to @item, notice: "商品をリクエストしました。"
    else
      redirect_to :root, notice: "エラーが発生しました。"
    end

  end
end
