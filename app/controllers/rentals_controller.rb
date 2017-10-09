class RentalsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @rentals = Rental.where(user: current_user)
  end

  def show
  end

  def new
    @rental = Rental.new
    @rental.video = Video.find(params[:video_id])
  end

  def create
    rental_params = params.require(:rental).permit(:video_id)
    @rental = Rental.new
    @rental.video = Video.find(rental_params[:video_id])
    @rental.user = current_user
    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create(
        :email => current_user.email,
        :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => @rental.video.name,
        :currency    => 'aud'
    )
    
    @rental.charge_identifier
    @rental.save
    redirect_to rentals_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_rental_path(video_id: @rental.video.id)
  end
end
