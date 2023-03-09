class ArticlesController < ApplicationController
  # TODO: Secure root when auth is ready
  skip_before_action :authenticate_user!, only: %i[index show search]

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
    else
      @articles = Article.all
    end
    # Do the view

    # The `geocoded` scope filters only flats with coordinates
    @markers = @articles.map do |article|
      {
        lat: article.latitude,
        lng: article.longitude,
        info_window_html: render_to_string(partial: "info_popup", locals: { article: })
      }
    end
    @markers = @markers.to_json
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def article_params
    params.require(:article).permit(:name, :description, :image_url, :street, :city, :zipcode, :available)
  end
end
