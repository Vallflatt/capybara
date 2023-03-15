class BookingsController < ApplicationController
  # TODO: Secure root when auth is ready
  skip_before_action :authenticate_user!, only: %i[show]
  before_action :set_article, only: %i[new create confirm]

  def new
    @booking = Booking.new

    # Fetch all bookings for that article and map them as array of dates
    # between start and end dates
    booked_dates = Booking.where({ article: @article }).all.map do |booking|
      (booking.start_date..booking.end_date).to_a
    end
    # Flatten the array of arrays and map all dates to string yyyy-mm-dd
    @reserved = booked_dates.flatten.map { |date| date.strftime('%Y-%m-%d') }
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
    params[:booking][:status] = @booking.status if params[:booking][:status] == ""

    @booking.update(booking_update_params)
    redirect_to bookings_path
  end

  def show
    # Show details display here
    @booking = Booking.find(params[:id])
    return unless @booking.user_id != current_user.id && @booking.article.user_id != current_user.id

    redirect_to bookings_path
  end

  def destroy
  end

  def index
    @borrowed = Booking.where(user: current_user).order('id DESC').all
    @lent = Booking.joins(:article).where(article: { user: current_user }).order('id DESC')
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
