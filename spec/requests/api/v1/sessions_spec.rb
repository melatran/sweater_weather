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
    expect(response.status).to eq(200)
    expect(json[:data][:attributes].keys).to eq([:id, :email, :api_key])
    expect(json[:data][:attributes][:email]).to eq('email@gmail.com')
    expect(json[:data][:attributes][:api_key]).to_not be_nil
  end

  it "cant find user if they didn't register" do
    session_params = {
      'email': '1234@gmail.com',
      'password': 'password'
    }

    post '/api/v1/sessions', params: session_params

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json[:email]).to eq(["Invalid email address"])
  end

  it "cant login if password incorrect" do
    session_params = {
      'email': 'email@gmail.com',
      'password': '1234'
    }

    post '/api/v1/sessions', params: session_params

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(json[:password]).to eq(['Incorrect password'])
  end
end
