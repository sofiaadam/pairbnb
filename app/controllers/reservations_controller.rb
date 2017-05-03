class ReservationsController < ApplicationController
 def create
    #Finds all the information of the listing for this booking
    @listing = Listing.find(params[:listing_id])

    #creates a booking object with the current_user id, together with the params from the form
    @reservation = current_user.reservations.new(reservation_params)
    
    #all the listing information is stored with the booking, which in this case is the listing id in booking
    @reservation.listing = @listing
    if @reservation.save
      redirect_to current_user
    else
      @errors = reservation.errors.full_messages
      render "listings/show"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to @reservation.user
  end

  private
    def reservation_params
        #what this does is to say that the listing object can only pass in these following params
        params.require(:reservation).permit(:start_date, :end_date)
    end
end