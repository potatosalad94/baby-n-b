class BookingsController < ApplicationController
  before_action :set_booking

  def index
    @bookings = policy_scope(Booking).all
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(start_date: params[:booking][:start_date].to_date, end_date: params[:booking][:end_date].to_date)
    @booking.baby = Baby.find(params[:baby_id])
    authorize @booking
    if @booking.save
      redirect_to baby_path(@baby)
    else
      render :new
    end
  end

  private

  def set_booking
    @baby = Baby.find(params[:baby_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

