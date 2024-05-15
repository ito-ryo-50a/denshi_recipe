class BookmarksController < ApplicationController
  before_action :require_login

  def index
    @bookmarks = current_user.bookmarks
  end

  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.bookmark(recipe)
    flash[:success] = 'ブックマークしました'
    redirect_to recipes_path
  end

  def destroy
    recipe = current_user.bookmarks.find(params[:id]).recipe
    current_user.unbookmark(recipe)
    flash[:success] = 'ブックマークを解除しました'
    redirect_to recipes_path, status: :see_other
  end
end
