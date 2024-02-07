class BreedsController < ApplicationController
  def index
    @breeds = Breed.all
  end
end
