## Task Tracker API Backend

This repository contains the backend API for the Task Tracker application, built using Ruby on Rails. It exposes a set of endpoints for managing tasks (create, index) and utilizes RSpec and FactoryBot for robust testing. 

## Technology Stack

- **Language:** Ruby (3.4.4) 
- **Framework:** Ruby on Rails (8.1.1) 
- **Database:** SQLite3
- **Testing:** RSpec, FactoryBot, Faker

## Install Dependencies

Use Bundler to install all necessary Ruby gems defined in the Gemfile:  

````
bundle install
````

## Database Setup

Set up the database structure and load any initial seed data: 

````
rails db:create

# Runs all pending migrations to build the schema
rails db:migrate
````

## Run the Server

Start the Rails server. By default, it will run on http://localhost:3000.

````
rails server
````

## Running Tests (RSpec)

The project uses RSpec for all testing (unit, integration, and request specs). Running the tests is crucial to verify that the API endpoints and business logic are functioning correctly.

1. Prepare the Test Database

Before running tests, ensure your test database is set up and has the latest schema:

````
rails db:test:prepare
````

## Execute the Tests

Run the entire test suite from the root directory:

````
bundle exec rspec
# OR (shorter alias)
rspec

````

## Running Specific Tests

To run tests for a specific file or directory:
Bash

````
# Run all tests in the models directory
rspec spec/models

# Run tests in a specific file
rspec spec/requests/api/v1/tasks_spec.rb
````
