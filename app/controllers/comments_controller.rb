class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to recipe_path(comment.recipe), notice: 'コメントを投稿しました'
    else
      redirect_to recipe_path(comment.recipe), alert: 'コメントの投稿に失敗しました'
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy!
    redirect_to recipe_path(comment.recipe), notice: 'コメントを削除しました', status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(recipe_id: params[:recipe_id])
  end
end
