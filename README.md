# GPIU - National Study Platform

## Developed by
* Felix Münscher
* Gian Sass

## Setup

### Dependencies
In order to get this app running, the following dependencies are required:

* Ruby: 2.7.1
    * Installation via [rbenv](https://github.com/rbenv/rbenv) recommended
* SQLite
    * For development environment 
* PostgreSQL
    * For production environment
    * Installation via [docker](https://hub.docker.com/_/postgres) recommended

### Configuration

* To install all Gems, run: `bundle install`
    * To install without production gems, run: `bundle install --without=production`
* If `wicked_pdf` fails to install, take a look into chapter [Export PDF](#export-pdf)
#### Database Seed

The database has to be applied for any new instance of the application. 

* In `production` only the participating countries are initialized.
* In `development` the seed will not only initialize the participating countries, but setup a suite of test data. See below.

To apply the seed, the following command has to be executed
```
rails db:seed
```

##### Development Test Data
In `development` mode the following test data will be created:

* 1 Admin User
    * E-Mail: admin@test.org 
    * Password: test123
* 1 Regional Admin User for each country
    * E-Mail: regional_\<iso2-code\>@test.org
    * Password: test123
* 5 Random Users
    * E-Mail: user<i>@test.org
        * i can be 1 - 5
    * Password: test 123
* 10 Hospitals for random countries
    * With 1-5 random departments
    

#### Export PDF
The export uses [wkhtmltopdf](https://wkhtmltopdf.org).
It should be included as a binary gem using bundler.
If this fails, install wkhtmltopdf using your distribution and tell [wicked_pdf](https://github.com/mileszs/wicked_pdf)  where the local installation is.
Tell bundler to install without the binary by running `bundle install --without wk_binary`.

## Deployment

### Setup

### CI/CD

