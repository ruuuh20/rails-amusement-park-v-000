class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user

  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end
  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update_attributes(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      redirect_to edit_attraction_path(@attraction)
    end
  end

    private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
