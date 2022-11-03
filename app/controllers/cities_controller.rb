class CitiesController < ApplicationController
  before_action :authenticate_user, only: [:index]
  def index
    @city = City.all
  end
  
  def show
    @city = City.find(params[:id])
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    @city.update(city_params)
    redirect_to cities_path
  end
  def new
    @city = City.new
  end

  def create
    city = City.create(city_params)
    redirect_to cities_path(city.id)
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_path
  end
end

private

def city_params
  params.require(:city).permit(:name, :zip_code)
end
def authenticate_user
  unless current_user
    flash[:danger] = "Please log in."
    redirect_to new_session_path
  end
end
