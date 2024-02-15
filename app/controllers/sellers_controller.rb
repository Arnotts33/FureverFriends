class SellersController < ApplicationController
  def index
    @user = current_user.profile
    @breed = Breed.find(params[:breed_id])
    @sellers = Seller.by_breed(@breed.name).all
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
    @chatrooms = @seller.chatrooms
    @breed_seller = BreedSeller.where(seller_id: @seller.id).first
    @breed = @breed_seller.breed.name
  end

  def create_chatroom
    @seller = Seller.find(params[:id])
    @chatroom = @seller.chatrooms.create(user_id: current_user.id, name: "Chatroom for #{@seller.name}")
    redirect_to chatroom_path(@chatroom)
  end

  private

  def seller_params
    params.require(:seller).permit(:name, :address, :email, :phone_number)
  end
end
