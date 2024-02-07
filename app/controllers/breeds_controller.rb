class BreedsController < ApplicationController

  def index
    @breeds = Breed.all
  end

  def show
    @breed = Breed.find(params[:id])
  end

  private

  def breed_params
    params.require(:breed).permit(:name, :details, :description, :picture)
  end

end
