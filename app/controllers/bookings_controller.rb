class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    # @booking.snack = @snack
    @booking.save

    redirect_to snack_path(@snack)
  end

  def accept


  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :snack_id)
  end
end
