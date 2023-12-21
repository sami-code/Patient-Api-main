# README

* Ruby version = 3.1.1

* Rails version = 7.0.2.2

* Setup
  - Clone Repo
  - Run bundle install to install gems
  - Run `rails db:setup` to setup the db
  - Run `rails s` to run the server

* Endpoints for testing
 - Create Patient: http://localhost:3000/patients
 - Show Patient: http://localhost:3000/patients/:ic_number
 - Create Result: http://localhost:3000/results
 - Show Result: http://localhost:3000/results/:id
