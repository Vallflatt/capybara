class ApiController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[address_from_coordinates]

  def address_from_coordinates
    render :json => Geocoder.search("#{params[:lat]},#{params[:lon]}").first
  end

end
