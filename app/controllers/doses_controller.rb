class DosesController < ApplicationController
  before_action :set_dose, only: [:edit, :update, :destroy]

  def index
    @doses = Dose.all
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @dose.update(dose_params)
    redirect_to doses_path
  end

  def destroy
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
