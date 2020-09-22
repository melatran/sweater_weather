# Sweater Weather

This is a solo project for Backend Mod3 at Turing 2003. You are a back-end developer working on a team that is building an application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination. Your team is working in a service-oriented architecture. The front-end will communicate with your back-end through an API. Your job is to expose that API that satisfies the front-end team’s requirements.

[View in Production](http://sweater-weather-2003.herokuapp.com/api/v1/forecast?location=anaheim,ca)

Adjust the path with the different endpoints below

## Project Description
This is an API based application built in Ruby on Rails. The app allows users to enter their destination to retrieve the daily, hourly, and weekly forecast through implementing MapQuest's Geocoding API and OpenWeather's API. The background of the landing page is a random image pulled from Unsplash's API that matches the location entered in the app. Endpoint needs to use the city and state from the GET request and send it to MapQuest’s Geocoding API to retrieve the latitude and longitude for the city. Use of the MapQuest’s Geocoding API is a hard requirement. Retrieve forecast data from the OpenWeather One Call API using the latitude and longitude from MapQuest.

SweaterWeather allows users to plan road trips that will notify them of the travel time as well as the current forecast of their end destination. Users have the opportunity to create an account and login. Passwords are encrypted using SecureRandom.

## Learning Goals
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

## Setup

1. Clone this repo `git@github.com:melatran/sweater_weather.git`
2. Install the gems `bundle install`
3. Create the database `rails db:create`
4. Create the migrations `rails db:migrate`
5. Run `bundle exec figaro install`to create application.yml file
6. Add API Keys to `application.yml`
7. To run on your local server `rails server` and visit `localhost:3000`

## Endpoints

GET `/api/v1/forecast?location=anaheim,ca`

<img width="472" alt="Screen Shot 2020-08-02 at 12 09 31 AM" src="https://user-images.githubusercontent.com/59414750/89117683-8a3fcd80-d454-11ea-9e76-09fda9be6188.png">

GET `/api/v1/backgrounds?location=anaheim,ca`

<img width="1021" alt="Screen Shot 2020-08-02 at 12 12 06 AM" src="https://user-images.githubusercontent.com/59414750/89117715-d985fe00-d454-11ea-899b-d9e9c13085ed.png">

POST `/api/v1/users`

If the user was created successfully. This will be the response

<img width="843" alt="Screen Shot 2020-08-02 at 8 23 07 AM" src="https://user-images.githubusercontent.com/59414750/89126287-75395d80-d499-11ea-9521-d3a68a28f484.png">

If the user was not created successfully. This will be the response to tell the user why it was not registered.

<img width="846" alt="Screen Shot 2020-08-02 at 11 11 54 AM" src="https://user-images.githubusercontent.com/59414750/89129285-00721d80-d4b1-11ea-916f-a9f33d81ff14.png">

POST `/api/v1/sessions`

If the user was created successfully, the response will be similar to when a user successfully creates an account.

<img width="843" alt="Screen Shot 2020-08-02 at 8 23 07 AM" src="https://user-images.githubusercontent.com/59414750/89126287-75395d80-d499-11ea-9521-d3a68a28f484.png">

If the user was unable to login, the response will tell the user what their errors are as well as given a 400 status error.

<img width="846" alt="Screen Shot 2020-08-02 at 11 10 25 AM" src="https://user-images.githubusercontent.com/59414750/89129260-ce60bb80-d4b0-11ea-9020-f3b6e12d38c1.png">

POST `/api/v1/roadtrip`

If the the entered the correct credentials and an origin and destination, they will see this as their response.

<img width="697" alt="Screen Shot 2020-08-03 at 2 23 37 PM" src="https://user-images.githubusercontent.com/59414750/89228730-03ded500-d595-11ea-811e-3689190cb867.png">
