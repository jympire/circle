class ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    gym = Gym.find(params[:gym_id])
    
    if current_user == gym.user
      flash[:alert] = "You cannot book your own property!"
    else
      start_date = Date.parse(reservation_params[:start_date])
      end_date = Date.parse(reservation_params[:end_date])
      days = (end_date - start_date).to_i + 1

      @reservation = current_user.reservations.build(reservation_params)
      @reservation.gym = gym
      @reservation.price = gym.price
      @reservation.total = gym.price * days
      @reservation.save

      flash[:notice] = "Booked Successfully!"
    end
    redirect_to gym
  end
  
  def your_bookings
    @bookings = current_user.reservations.order(start_date: :asc)
  end
  
  def your_reservations
    @gyms = current_user.gyms
  end
  
  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date)
    end
end
