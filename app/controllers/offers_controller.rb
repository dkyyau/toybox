class OffersController < ApplicationController
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

  def update
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
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

  private

  def offer_params
    params.require(:offer).permit(:start_date, :end_date, :location, :toy_id)
  end
end
