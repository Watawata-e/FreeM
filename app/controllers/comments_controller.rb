class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(user_id: params[:user_id], item_id: params[:item_id], sentence: params[:sentence])
    if @comment.save
      redirect_to @item, notice: "コメントしました"
    else
      redirect_to @item, notice: "コメントできませんでした"
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to @item, notice: "コメントを削除しました"
  end
end
