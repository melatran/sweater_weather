class Api::V1::BackgroundsController < ApplicationController
  def index
    image_data = UnsplashService.new.get_background_url(params[:location])
    photo = Photo.new(image_data)

    render json: BackgroundsSerializer.new(photo)
  end
end
