class PaintingsController < ApplicationController

    def create
      painting = Painting.new(painting_params)
      if painting.save
        render json: PaintingSerializer.new(painting)
      else
        render json: {message: painting.errors.full_messages}
      end
    end
  
    def destroy
      painting = Painting.find_by(id: params[:id])
      painting.destroy
      render json: {message: "success"}
    end

    private
  
    def painting_params
      params.require(:painting).permit(:content, :museum_id)
    end
  
  end
