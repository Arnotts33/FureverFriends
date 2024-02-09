class BreedsController < ApplicationController

  def index
    @user = current_user
    @breeds = Breed.all
  end

  def show
    @user = current_user
    @breed = Breed.find(params[:id])
  end

  private

  def breed_params
    params.require(:breed).permit(:name, :details, :description, :picture)
  end

end
