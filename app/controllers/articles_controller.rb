class ArticlesController < ApplicationController
  # TODO Secure root when auth is ready
  skip_before_action :authenticate_user!, only: [ :index, :show, :search ]

  def index
  end

  def search
    # Get search param and address
    @search = params.has_key?(:search) ? params["search"] : ''
    @address = params.has_key?(:address) ? params["address"] : ''
    # Calculate coordinate from address https://medium.com/@tali.scheer/ruby-geocoder-gem-9733650e9339
    result = Geocoder.search(params["address"])
    location = result.length > 0 && result[0].data ? result[0].data : nil
    # Fetch DB with LIKE search param and NEAR coordinates Load the result instance variable
    if @search != '' && !location.nil?
      @articles = Article.where("name ILIKE ?", "%#{@search}%").near([location["lat"], location["lon"]], 30)
    end
    # Do the view
  end

  def show
  end
end
