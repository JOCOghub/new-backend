class MuseumsController < ApplicationController

    def index
      # options = {
      #    include: [:instruments]
      #  }
      # render({json: museum.all, include: [:instruments]})
      # render json: museum.all, include: [instruments: {only: [:content]}], except: [:created_at, :updated_at]
      render json: MuseumSerializer.new(Museum.all)
      # render json: museumSerializer.new(museum.all, options)
    end
  
    def create
      museum = Museum.new(museum_params)
      if museum.save
        render json: MuseumSerializer.new(museum)
      else
        render json: {message: museum.errors.full_messages}
      end
    end
  
    def destroy
      museum = Museum.find_by(id: params[:id])
      museum.destroy
      render json: {message: "success"}
    end
  
    private
  
    def museum_params
      params.require(:museum).permit(:name)
    end
  
  
  end
