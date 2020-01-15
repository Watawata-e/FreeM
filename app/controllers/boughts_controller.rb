class BoughtsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @boughts = @user.boughts
    end
  end

  def show
  end

  def new
    @test = "これはてすと〜"
    @bought = Bought.new(item_id: @item.id)
  end

  def edit
  end

  def create
    @item = Item.find(params[:item])
    @number = params[:number]
    @bought = Bought.new(user_id: current_user.id, item_id: params[:item], number: params[:number])
    @item.stock = @item.stock - @number.to_i
    if @bought.save && @item.save
      redirect_to :root, notice: "商品を購入しました。"
    else
      redirect_to :root, notice: "エラーが発生しました。"
    end
  end

  def update
  end

  def destroy
  end
end
