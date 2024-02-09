class BreedsController < ApplicationController
  def index
    # Fetch breeds for the current user
    @breeds_array = current_user.breeds
  end

  def show
    @breed = Breed.find(params[:id])
  end

  private

  def breed_params
    params.require(:breed).permit(:name, :details, :description, :picture)
  end
end
