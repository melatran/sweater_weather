class Api::V1::BackgroundsController < ApplicationController
  def index
    image_data = UnsplashService.new.get_background_url(params[:location])
    if image_data[:results].empty?
      render json: {status: 404, result: 'There are zero results for this location'}, status: 404
    else
      photo = Photo.new(image_data)
      render json: BackgroundsSerializer.new(photo)
    end
  end
end
