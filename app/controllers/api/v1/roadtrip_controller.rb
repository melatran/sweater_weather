class Api::V1::RoadtripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])

    direction = MapQuestService.new.get_route(params[:origin], params[:destination])

    #params origin, desination, api_key
  end
end
