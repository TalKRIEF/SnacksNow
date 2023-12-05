class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :decline]

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

  def accept
    @booking.booked = true
    if @booking.save!
      redirect_to snack_path(@booking.snack), notice: 'Booking accepted successfully'
    else
      redirect_to snack_path(@booking.snack), notice: 'Booking could not be accepted'
    end
  end

  def decline
    if @booking.destroy
      redirect_to snack_path(@booking.snack), notice: 'Booking declined'
    else
      redirect_to snack_path(@booking.snack), notice: 'Booking could not be declined'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  # def booking_params
  #   params.require(:booking).permit(:user_id, :snack_id)
  # end
end
