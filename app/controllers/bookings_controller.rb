class BookingsController < ApplicationController
  def create
    @meal = Meal.find(params[:meal_id])
    @booking = Booking.new#(booking_params)
    @booking.meal = @meal
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render inline: "<p><%= @booking.errors.full_messages.join(',') %></p>"
    end
  end
      
  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def destroy
    @booking = set_booking
    @booking.destroy
    redirect_to user booking_path
    authorize @booking
  end

  private
   
  def set_booking
    @booking = Booking.find(params[:id])
  end
  
  def booking_params
    params.require(:booking).permit(:meal_id)
  end

end
