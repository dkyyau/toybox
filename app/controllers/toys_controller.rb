class ToysController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @toys = Toy.geocoded

    @markers = @toys.map do |toy|
      {
        lat: toy.latitude,
        lng: toy.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { toy: toy })
      }
    end

    # search for toys
    if params[:query].present?
      sql_query = " \
        toys.name ILIKE :query \
        OR toys.description ILIKE :query \
        OR categories.name ILIKE :query\
      "
      @toys = Toy.joins(:category).where(sql_query, query: "%#{params[:query]}%")
    else
      @toys = Toy.all
    end
  end

  def show
    @toy = Toy.find(params[:id])
    @offer = Offer.new
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy = Toy.new(toy_params)
    @toy.user = current_user
    if @toy.save
      redirect_to toy_path(@toy)
    else
      render 'new'
    end
  end

  def edit
    @toy = Toy.find(params[:id])
  end

  def update
    @toy = Toy.find(params[:id])
    @toy.update(toy_params)
    redirect_to toy_path(@toy)
  end

  def destroy
    @toy = Toy.find(params[:id])
    @toy.destroy
    redirect_to toys_path
  end

   private

  # def set_toy
  # end

  def toy_params
    params.require(:toy).permit(:name, :description, :price, :category_id, :photo, :location)
  end
end
