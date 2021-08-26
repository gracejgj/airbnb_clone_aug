class BookingsController < UsersController
  def create
    @listing = Listing.find(params[:listing_id])
    @booking = @listing.bookings.create(booking_params.merge(user_id: current_user.id))

    if @booking.save
      redirect_to user_path(current_user), notice: 'Booking was successfully created.'
    else
      redirect_to listing_path(@listing), alert: 'There was an error. Please try again.'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def success
  end

  def cancel
  end

  private
   def booking_params
     params.require(:booking).permit(:check_in_date, :check_out_date)
   end

end
