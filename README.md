# Payment App

## Run the system on development
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


## Deploy to production

To set up rails in production mode you need to configure the `rails_env` to production:

``` bash
export RAILS_ENV=production
```

Create secret key.

```bash
$ bundle exec rake secret
```
 The output of this command is the value to the `secret_key_base` environment variable.
```bash
export SECRET_KEY_BASE=OUTPUT_SECRET_KEY
```

The last one variable is the database url with the format in the example.

``` bash
export DATABASE_URL="postgres://myuser:mypass@localhost/somedatabase"
```

Next install the gems dependencies using bundle.

```bash
$ bundle install --deployment --without development test
```

And in the finish step compile to assets create the database, migrations and initial data.
```bash
$ bundle exec rake assets:precompile db:create db:migrate db:seed RAILS_ENV=production
```

In production the project run with `passenger` and `nginx` the complite documentation is [here](https://www.phusionpassenger.com/library/walkthroughs/deploy/).

The SSL certificate is created with certbot see offitial documentation [here](https://certbot.eff.org/).

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
