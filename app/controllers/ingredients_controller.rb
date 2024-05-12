class IngredientsController < ApplicationController
  def search
    query = params[:query]
    ingredients = Ingredient.search_by_name(query)
    render json: ingredients.map(&:display_name)
  end

  def index
    @ingredients = Ingredient.all
  end
end
