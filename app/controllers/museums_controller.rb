class MuseumsController < ApplicationController
  before_action :set_museum, only: [:show, :update, :destroy]

  def index
    @museums = Museum.all

    render json: @museums
  end

  def show
    render json: @museum
  end

  def create
    @museum = Museum.new(museum_params)

    if @museum.save
      render json: @museum, status: :created, location: @museum
    else
      render json: @museum.errors, status: :unprocessable_entity
    end
  end

  def update
    if @museum.update(museum_params)
      render json: @museum
    else
      render json: @museum.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @museum.destroy
    render json: @museum
  end

  private
    
    def set_museum
      @museum = Museum.find(params[:id])
    end

    def museum_params
      params.require(:museum).permit(:name)
    end
end