class ToysController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @toys = Toy.all
  end

  def show
    @toy = Toy.find(params[:id])
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy = Toy.new(toy_params)
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
    params.require(:toy).permit(:name, :description, :price, :category)
  end
end
