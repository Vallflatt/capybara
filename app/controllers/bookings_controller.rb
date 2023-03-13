class BookingsController < ApplicationController
  # TODO Secure root when auth is ready
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_article, only: %i[new create confirm]

  def new
    #récupérer le username pour afficher sur vue
    @article.user[:username]
    # récupérer l'article image_url pour afficher sur vue
    @booking = Booking.new
    # booking/new afficher l'article et le formulaire de booking
  end

  def create
    @booking = Booking.new(booking_create_params)
    @booking.article = @article
    @booking.status = Booking.statuses[:pending]
    @booking.user = current_user
    if @booking.save
      redirect_to article_booking_confirm_path(@article, @booking)
    else
      redirect_to new_article_booking_path(@article), status: :unprocessable_entity, alert: 'Nécessite date correcte'
    end
  end

  def confirm
    # Page de confirmation après demande de réservation
  end

  def edit
    # Booking edit form sent here
  end

  def update
    @booking = Booking.find(params[:id])

    # In case the from is sent without a status, we keep to old one
    if params[:booking][:status] == ""
      params[:booking][:status] = @booking.status
    end

    @booking.update(booking_update_params)
    redirect_to bookings_path
  end

  def show
    # Show details display here
    @booking = Booking.find(params[:id])
    if @booking.user_id != current_user.id && @booking.article.user_id != current_user.id
      redirect_to bookings_path
    end
  end

  def destroy
  end

  def index
    @borrowed = Booking.where(user: current_user).all
    @lent = Booking.joins(:article).where(article: { user: current_user })
  end

  private

  def booking_create_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def booking_update_params
    params.require(:booking).permit(:status, :message)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

end
