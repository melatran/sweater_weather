class Api::V1::RoadtripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      roadtrip = Roadtrip.new(params[:origin], params[:destination]).format_roadtrip
      render json: {status: 200, roadtrip: roadtrip}, status: 200
    end
  end
end
