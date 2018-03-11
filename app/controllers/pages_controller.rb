class PagesController < ApplicationController
  def home
    @gyms = Gym.where(active: true).limit(12)
  end
  
  def terms
  end
  
  def host
  end
  
  def nondiscrimination
  end
  
  def payments
  end
  
  def privacy
  end
  
  def host_guarantee
  end
  
  def guest_refund
  end
  
  def copyright
  end
  
  def cookie
  end
  
  def guest_waiver
  end
  
  def how_it_works
  end
  
  def for_trainers
  end
  
  def for_gyms
  end
  
  def for_clients_and_guests
  end

  def search
    # STEP 1
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @gyms_address = Gym.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @gyms_address = Gym.where(active: true).all
    end

    # STEP 3
    @search = @gyms_address.ransack(params[:q])
    @gyms = @search.result

    @arrGyms = @gyms.to_a

    # STEP 4
    if (params[:start_date] && params[:end_date] && !params[:start_date].empty? &&  !params[:end_date].empty?)

      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @gyms.each do |gym|

        not_available = gym.reservations.where(
          "((? <= start_date AND start_date <= ?)
          OR (? <= end_date AND end_date <= ?)
          OR (start_date < ? AND ? < end_date))
          AND status = ?",
          start_date, end_date,
          start_date, end_date,
          start_date, end_date,
          1
        ).limit(1)
        
        not_available_in_calendar = Calendar.where(
          "gym_id = ? AND status = ? AND day <= ? AND day >= ?",
          gym.id, 1, end_date, start_date
        ).limit(1)

        if not_available.length > 0 || not_available_in_calendar.length > 0
          @arrGyms.delete(gym)
        end
      end
    end

  end
end

