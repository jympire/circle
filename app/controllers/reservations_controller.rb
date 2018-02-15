class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [:approve, :decline]
  
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
      # @reservation.save
      
      if @reservation.save
        if gym.Request?
          flash[:notice] = "Request sent successfully!"
        else
          @reservation.Approved!
          flash[:notice] = "Reservation created successfully!"
        end
      else
        flash[:alert] = "Cannot make a reservation!"  
      end

    end
    redirect_to gym
  end
  
  def your_bookings
    @bookings = current_user.reservations.order(start_date: :asc)
  end
  
  def your_reservations
    @gyms = current_user.gyms
  end
  
  def approve
    @reservation.Approved!
    redirect_to your_reservations_path
  end

  def decline
    @reservation.Declined!
    redirect_to your_reservations_path
  end
  
  private
  
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
  
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date)
    end
end
