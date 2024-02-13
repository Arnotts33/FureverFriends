class BreedsController < ApplicationController
  def index
    @user = current_user
    @breeds = Breed.all
    @breed_names = params[:breeds_names]
    @breed_names = @breed_names.map do |breed|
      # create the new plant_tag
      breed_name = Breed.find_by(
      "name ILIKE ?", "%#{breed}%"
    )
    end.compact
  end

  def show
    @user = current_user
    @breed = Breed.find(params[:id])
  end

  private

  def breed_params
    params.require(:breed).permit(:name, :lifespan, :weight, :score, :description, :picture)
  end
end
