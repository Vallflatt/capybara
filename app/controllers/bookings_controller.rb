class BookingsController < ApplicationController
  def create
    # Booking form sent here

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
