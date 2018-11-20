class CitiesController < ApplicationController
  before_action :search_cities, only: [:index]

  # GET /cities
  def index
    render json: @cities
  end

  private
    def search_cities
      @cities = query_params.blank? ? City.all : City.search_name(query_params[:url_name])
    end

    def query_params
      return if !params.key?(:city) || params[:city].blank?
      params.require(:city).permit(:id, :url_name)
    end
end
