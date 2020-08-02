require 'rails_helper'

describe "Users Api" do
  it 'can create a new user' do
    user_params = { 'email': 'email@gmail.com',
      'password': 'password',
      'password_confirmation': 'password' }

    post '/api/v1/users', params: user_params

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    # expect(json[:data][:attributes][:name]).to eq(item_params[:name])
    # expect(item.description).to eq(item_params[:description])
    # expect(item.unit_price).to eq(item_params[:unit_price])
    end
end
