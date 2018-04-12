class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients << Ingredient.new
    @recipe.ingredients << Ingredient.new
  end

  def create
    @recipe = Recipe.create(recipe_params)

    if @recipe.valid?
      redirect_to recipe_path(@recipe)
    else
      render :new
    end

  end

  private

  def recipe_params
    # puts params
    params.require(:recipe).permit(Recipe.column_names,:ingredients_attributes=>[:name, :quantity])
  end

end
