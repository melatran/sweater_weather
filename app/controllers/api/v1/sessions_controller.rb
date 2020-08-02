class Api::V1::SessionsController < ApplicationController
  def create
    #find by email and api key?
    user = User.find_by(email: params[:email])

    if user.nil?
      render json: {status:400, email: 'Invalid email address'}, status: 400
    elsif user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      render json: {status: 400, password: 'Incorrect password'}, status: 400
    end
  end
end
