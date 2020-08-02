require 'rails_helper'

describe 'Sessions endpoints' do
  before :each do
    user_params = {
      'email': 'email@gmail.com',
      'password': 'password',
      'password_confirmation': 'password' }

    post '/api/v1/users', params: user_params
  end

  it "can find a user if its in the system" do
    session_params = {
      'email': 'email@gmail.com',
      'password': 'password'
    }

    post '/api/v1/sessions', params: session_params

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  end
end
