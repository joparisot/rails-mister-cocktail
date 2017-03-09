class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail_id = @cocktail.id
    @dose.save
    if !(params[:dose][:ingredient] == "") # returning false whatever
      @dose.ingredient = Ingredient.find(params[:dose][:ingredient])
      if @dose.valid?
        @dose.save
        redirect_to dose_path(@dose)
      else
        render :new
        # render 'cocktails/#{@cocktail.id}/doses/new'
        # render new_cocktail_dose_path(@cocktail)
      end
    else
      # render 'cocktails/#{@cocktail.id}/doses/new'
      render :new
      # render new_cocktail_dose_path(@cocktail)

    end


  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = Cocktail.find(@dose.cocktail_id)
    @dose.destroy

    redirect_to cocktail_path(@cocktail)
  end

  private

  def doses_params
    params.require(:dose).permit(:ingredient_id, :description) # ingredient or ingredient_id?
  end
end
