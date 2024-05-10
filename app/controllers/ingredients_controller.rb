class IngredientsController < ApplicationController
  def search
    query = params[:query]
    ingredients = Ingredient.where('name_hiragana LIKE :q OR name_katakana LIKE :q OR name_kanji LIKE :q', q: "%#{query}%")
    render json: ingredients.map { |ingredient| ingredient.display_name }
  end

  def index
    @ingredients = Ingredient.all
  end
end
