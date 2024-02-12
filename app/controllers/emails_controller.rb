class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  def index
    @emails = Email.all
  end

  def show
  end

  def new
    @email = Email.new
  end

  def create
    email = Email.new(email_params)

    if email.save
      redirect_to email, notice: 'Email was successfully sent.'
    else
      render :new
    end
  end

  def update
    if @email.update(email_params)
      redirect_to @email, notice: 'Email was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @email.destroy
    redirect_to emails_url, notice: 'Email was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_email
    @email = Email.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def email_params
    params.require(:email).permit(:user_id, :seller_id, :title, :content)
  end
end
