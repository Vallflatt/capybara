class BookingsController < ApplicationController
  # TODO Secure root when auth is ready
  skip_before_action :authenticate_user!, only: %i[new show]
  before_action :set_article, only: %i[new create confirm]

  def new
    #récupérer le username pour afficher sur vue
    @article.user[:username]
    # récupérer l'article image_url pour afficher sur vue
    @booking = Booking.new
    # booking/new afficher l'article et le formulaire de booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.article = @article
    @booking.status = Booking.statuses[:pending]
    @booking.user = current_user
    if @booking.save
      redirect_to article_booking_confirm_path(@article, @booking)
    else
      redirect_to articles_id_bookings_new_path(@article), status: :unprocessable_entity, alert: 'Nécessite date correcte'
    end
  end

  def confirm

  end

  def edit
    # Booking edit form sent here
  end

  def show
    # Show details display here
    # If I rent out, possibility to change status (display form) also say transaction finished
    # If I borrow, only display current details or cancel (destroy)
  end

  def destroy
  end

  def index
    @borrowed = Booking.where(user: current_user).all
    @lent = Booking.joins(:article).where(article: { user: current_user })
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

end
