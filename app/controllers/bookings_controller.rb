class BookingsController < ApplicationController
  # TODO Secure root when auth is ready
  skip_before_action :authenticate_user!, only: [:new, :show]

  def new
    #récupérer l'article id
    @article = Article.find(params[:article_id])
    #récupérer le username pour afficher sur vue
    @article.user[:username]
    #récupérer l'article image_url pour afficher sur vue
    @booking = Booking.new
    # booking/new afficher l'article et le formulaire de booking
  end

  def create
    # Booking form sent here
    #récupérer le user
    # render to view confirm
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
end
