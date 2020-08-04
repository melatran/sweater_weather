class Api::V1::RoadtripController < ApplicationController
  def create
    if authenticated_user?
      roadtrip = Roadtrip.new(params[:origin], params[:destination]).format_roadtrip
      render json: {status: 200, roadtrip: roadtrip}, status: 200
    else
      render json: {status: 400, api_key: 'Invalid credentials'}, status: 400
    end
  end

  private

  def authenticated_user?
    User.find_by(api_key: params[:api_key])
  end
end
