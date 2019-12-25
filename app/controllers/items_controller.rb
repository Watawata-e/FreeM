class ItemsController < ApplicationController
  def index
    @test = "てすとだよ"
    @items = Item.order("name").page(params[:page]).per(5)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
