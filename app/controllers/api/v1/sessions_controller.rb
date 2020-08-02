class Api::V1::SessionsController < ApplicationController
  def create
    #find by email and api key?
    user = User.find_by(email: params[:email])

    if user.nil?
      render json: {email: ['Invalid email address']}
    elsif user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      render json: {password: ['Incorrect password']}
    end
  end
end
