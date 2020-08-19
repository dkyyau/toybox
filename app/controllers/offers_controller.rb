class OffersController < ApplicationController
  before_action :set_offer, only: [ :update ]

  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
    @num_of_days = (@offer.end_date - @offer.start_date).to_i
  end

  def new
    @toy = Toy.find(params[:toy_id])
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @toy = Toy.find(params[:toy_id])
    @offer.toy = @toy
    @offer.user = current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render 'new'
    end
  end
  
  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    if params[:accepted]
      @offer.accepted = true
      @offer.save
      redirect_to bookings_path
    else
      @offer.update(offer_params)
      redirect_to offer_path(@offer)
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to bookings_path
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:start_date, :end_date,  :toy_id)
  end
end
