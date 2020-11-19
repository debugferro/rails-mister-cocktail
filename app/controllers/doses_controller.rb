class DosesController < ApplicationController
  before_action :set_information, only: [:new, :create]
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_information
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
