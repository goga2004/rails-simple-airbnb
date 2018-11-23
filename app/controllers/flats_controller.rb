class FlatsController < ApplicationController

  before_action :find_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def edit
  end

  def create
    @flat = Flat.new(require_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def update
    @flat.update(require_params)
    @flat.save
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to flats_path(@flat)
  end

  private

  def require_params
      params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
