class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :create]

  def index
    @bookings = policy_scope(Booking).where(user: current_user)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(start_date: params[:booking][:start_date].to_date, end_date: params[:booking][:end_date].to_date)
    @booking.baby = Baby.find(params[:baby_id])
    @booking.user = current_user
    authorize @booking

    # found = false
    # @all_bookings = Booking.all


    # if @booking.save
    #   redirect_to bookings_path
    # else
    #   render :new
    # end
    @date_start = @booking.start_date.strftime("%d-%m-%Y")
    @date_end = @booking.end_date.strftime("%d-%m-%Y")

    found = false
    @all_bookings = Booking.select { |book| book.baby == @booking.baby }
    @all_bookings.each do |booking|
      start_date = booking.start_date.strftime("%d-%m-%Y")
      end_date = booking.end_date.strftime("%d-%m-%Y")
      if (@date_start <= start_date) && (@date_start <= end_date) || (@date_end <= start_date) && (@date_end <= end_date)
        if booking.baby == @booking.baby
          found = true
        end
      end
    end

    if found == true
      flash.now[:alert] = "This baby is already booked in the period you want to book it"
      render :new
    else
      @booking.save
      redirect_to bookings_path
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def total(booking)
    start_date = booking.start_date.strftime("%d-%m-%Y")
    end_date = booking.start_date.strftime("%d-%m-%Y")
    total = start_date - end_date
    return total
  end

  def set_booking
    @baby = Baby.find(params[:baby_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
