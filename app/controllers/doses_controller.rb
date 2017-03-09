class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail_id = @cocktail.id
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient])
    @dose.save

    redirect_to cocktails_path
  end

  def destroy

  end

  private

  def doses_params
    params.require(:dose).permit(:ingredient_id, :description) # ingredient or ingredient_id?
  end
end
