# Payment App

## Run the system
Install gems dependencies

```bash
$ bundle install
```

Setup the [database.yml](config/database.yml) with your database credentials and host.
```yml
default: &default
  username: YOUR_DB_USER
  password: YOUR_DB_PWD
  host: YOUR_DB_HOST
```
Use the next commands to run the system.

```bash
$ rails db:create && rails db:migrate && rails db:seed
```

This will create the database, tables and add initial columns to tables.
Then to run the system use the next command:
```bash
$ bin/dev
```

This command will up the rails server and the javascript and css listeners to edit ReactJS view and set custom CSS.

## Entity Relationship Diagram

The next image is the entity relationship diagram to the system.

![Entity Relationship Diagram](erd.png "Entity Relationship Diagram")

## Software used
 - Visual Studio Code
 - Sublime merge
 - Docker
 - Ubuntu 22.04
 - PostgreSQL 14
 - Postman v9.31.28

## Frameworks and languages
 - Ruby 3.2.2
 - Ruby on Rails 7.0.5
 - JavaScript
 - ReactJS 18.2

## Architecture
 - MVC
 - API Rest
