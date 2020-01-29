class CommentsController < ApplicationController
  def create
    if params[:item_id].present?
      @item = Item.find(params[:item_id])
      @comment = Comment.new(user_id: params[:user_id], item_id: params[:item_id], sentence: params[:sentence])
      if @comment.save
        redirect_to @item, notice: "コメントしました"
      else
        redirect_to @item, notice: "コメントできませんでした"
      end
    elsif params[:admin_id].present?
      @comment = Comment.new(user_id: params[:user_id], administrator_id: params[:admin_id], sentence: params[:sentence])
      if @comment.save
        redirect_to admin_user_path(params[:user_id]), notice: "コメントしました"
      else
        redirect_to admin_user_path(params[:user_id]), notice: "コメントできませんでした"
      end
    else
      recirect_to :root, notice: "エラーです。"
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to @item, notice: "コメントを削除しました"
  end
end
