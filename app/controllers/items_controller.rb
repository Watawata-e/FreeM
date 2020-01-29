class ItemsController < ApplicationController
  def search
    @items = Item.search(params[:name_q], params[:category_q]).page(params[:page]).per(10)
    render "index"
  end

  def index
    @items = Item.order("name").page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
    @comments = Comment.where(item_id: @item.id)
  end

  def new
    @item = Item.new(user_id: current_user.id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      redirect_to @item, notice: "出品しました。"
    else
      render "new"
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.assign_attributes(params[:item])
    if @item.save
      redirect_to @item, notice: "商品情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to :items, notice: "商品を削除しました。"
  end
end
