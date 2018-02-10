class PhotosController < ApplicationController

  def create
    @gym = Gym.find(params[:gym_id])

    if params[:images]
      params[:images].each do |img|
        @gym.photos.create(image: img)
      end

      @photos = @gym.photos
      redirect_back(fallback_location: request.referer, notice: "Saved.")
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @gym = @photo.gym

    @photo.destroy
    @photos = Photo.where(gym_id: @gym.id)

    respond_to :js
  end
end