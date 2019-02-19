class BookingsController < ApplicationController
  before_action :set_booking
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.baby = Baby.find(params[:baby_id])
    authorize @booking

  end

  private

  def set_booking
    @baby = Baby.find(params[:baby_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
