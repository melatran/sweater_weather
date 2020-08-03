class Api::V1::RoadtripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: Roadtrip.new(params[:origin], params[:destination]).format_roadtrip
    end
  end
end
