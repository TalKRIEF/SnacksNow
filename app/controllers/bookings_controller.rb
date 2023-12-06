class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :decline]

  def create
    @booking = Booking.new(booking_params)
    @snack = Snack.find(params[:snack_id])
    @booking.snack = @snack
    @booking.user = current_user
    @booking.booked = false

    if @booking.save
      redirect_to snack_path(@snack), notice: 'La réservation a bien été enregistrée!'
    else
      redirect_to snack_path(@snack), notice: 'La réservation n\'a pas été enregistrée!'
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

  def booking_params
    params.require(:booking).permit(:date)
  end
end
