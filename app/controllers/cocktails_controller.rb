class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @ingredients = @cocktail.ingredients
    @doses = @cocktail.doses
    @dose = Dose.new
    @review = Review.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.url
      @cocktail.remote_photo_url = @cocktail.url
    end
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cocktail.url
      @cocktail.remote_photo_url = @cocktail.url
    end
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :url, :photo)
  end
end
