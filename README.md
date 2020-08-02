# Sweater Weather

This is a solo project for Backend Mod3 at Turing 2003.

## Project Description
You are a back-end developer working on a team that is building an application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination. Your team is working in a service-oriented architecture. The front-end will communicate with your back-end through an API. Your job is to expose that API that satisfies the front-end team’s requirements.

## Learning Goals
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

## Endpoints

GET `/api/v1/forecast?location=denver,co`

<img width="472" alt="Screen Shot 2020-08-02 at 12 09 31 AM" src="https://user-images.githubusercontent.com/59414750/89117683-8a3fcd80-d454-11ea-9e76-09fda9be6188.png">

GET `/api/v1/backgrounds?location=denver,co`

<img width="1021" alt="Screen Shot 2020-08-02 at 12 12 06 AM" src="https://user-images.githubusercontent.com/59414750/89117715-d985fe00-d454-11ea-899b-d9e9c13085ed.png">

POST `/api/v1/users`

If the user was created successfully. This will be the response

<img width="843" alt="Screen Shot 2020-08-02 at 8 23 07 AM" src="https://user-images.githubusercontent.com/59414750/89126287-75395d80-d499-11ea-9521-d3a68a28f484.png">

If the user was not created successfully. This will be the response to tell the user why it was not registered.

<img width="846" alt="Screen Shot 2020-08-02 at 8 26 22 AM" src="https://user-images.githubusercontent.com/59414750/89126352-deb96c00-d499-11ea-9bfa-b9426b3e6415.png">
