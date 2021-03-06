# JetRockets Test (crazy execution)

## Features

  - lightweight Sinatra based application with autorestart
  - SQLite3 database
  - puma server
  - dotenv for environments variables
  - rake console with pre-connected ActiveRecord, Awesome Print and Hirb
  - guard with various watchers

### requirements
It is tested and runs with:

  - ruby 2.5.1

## Running this application locally

Before running you should run the below command to make sure that you have the correct ruby gems installed:

    bundle install

Create file `.env` with required varilables (export var=...):

  - title *(Title of your project)*
  - project *(System name without spaces)*

Create databases and fill it with examples data:

    rake db:create
    rake db:migrate && rake db:test:prepare
    rake db:seed

To run this application locally, cd into the directory that you cloned and run:

    shotgun

To run console:

    rake console
