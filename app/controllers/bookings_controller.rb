class BookingsController < ApplicationController

  def create
    @booking = Booking.new
    @snack = Snack.find(params[:snack_id])
    @booking.snack = @snack
    @booking.user = current_user
    @booking.booked = false

    if @booking.save
      redirect_to snack_path(@snack)
    else
      render :snack_path
    end
  end

  # def accept
  #   if @booking.accepted!
  #     redirect_to @booking, notice: 'Offer accepted'

  #   end

  # end

  # private

  # def booking_params
  #   params.require(:booking).permit(:user_id, :snack_id)
  # end
end
