class GymsController < ApplicationController
  before_action :set_gym, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [:listing, :pricing, :description, :photo_upload, :amenities, :location, :update]
  
  def index
    @gyms = current_user.gyms
  end

  def new
    @gym = current_user.gyms.build
  end

  def create
    @gym = current_user.gyms.build(gym_params)
    if @gym.save
      redirect_to listing_gym_path(@gym), notice: "Saved."
    else
      flash[:alert] = "Select your gym type."
      render :new
    end
  end
  
  def show
    @photos = @gym.photos
    @user = @gym.user
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
    @photos = @gym.photos
  end

  def amenities
  end

  def location
  end

  def update
    new_params = gym_params
    new_params = gym_params.merge(active: true) if is_ready_gym
    
    if @gym.update(gym_params)
      flash[:notice] = "Saved."
    else
      flash[:alert] = "Something went wrong."
    end
    redirect_back(fallback_location: request.referer)
  end
  
  private
    def set_gym
      @gym = Gym.find(params[:id])
    end

    def is_authorised
      redirect_to root_path, alert: "You don't have permission." unless current_user.id == @gym.user_id
    end

    def is_ready_gym
      !@gym.active && !@gym.price.blank? && !@gym.listing_name.blank? && !@gym.photos.blank? && !@gym.address_string.blank?
    end

    def gym_params
      params.require(:gym).permit(:gym_type, :listing_name, :summary, :address_string, :is_internet, :is_lounge, :is_pool, :is_shower, :is_towel, :is_yoga, :is_cycling, :is_pilates, :is_basketball, :is_childcare, :is_weights, :is_boxing, :price, :active)
    end
end
