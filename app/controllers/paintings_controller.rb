class PaintingsController < ApplicationController
  before_action :set_painting, only: [:destroy]

  def index
    @paintings = Painting.all

    render json: @paintings
  end

  # def show
  #   render json: @painting
  # end

  def create
    @painting = Painting.new(painting_params)

    if @painting.save
      render json: @painting, status: :created, location: @painting
    else
      render json: @painting.errors, status: :unprocessable_entity
    end
  end

  # def update
  #   if @painting.update(painting_params)
  #     render json: @painting
  #   else
  #     render json: @painting.errors, status: :unprocessable_entity
  #   end
  # end

  def destroy
    @painting.destroy
    render json: @painting
  end

  private
    
    def set_painting
      @painting = Painting.find(params[:id])
    end

    def painting_params
      params.require(:painting).permit(:name, :museum_id)
    end
end