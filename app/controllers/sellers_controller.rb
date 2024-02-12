class SellersController < ApplicationController

  def index
    @user = current_user.profile
    @breed = Breed.find(params[:breed_id])
    @sellers = Seller.by_breed(@breed.name).near(@user.address, 100).all
    @markers = @sellers.geocoded.map do |seller|
      {
        lat: seller.latitude,
        lng: seller.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {seller: seller}),
        marker_html: render_to_string(partial: "marker")
      }
    end
    @user_marker = {
      lat: @user.latitude,
      lng: @user.longitude,
    }
  end


  def show
    @seller = Seller.find(params[:id])
  end

  private

  def seller_params
    params.require(:seller).permit(:name, :address, :email, :phone_number)
  end
end
