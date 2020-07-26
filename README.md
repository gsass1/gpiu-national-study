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

* To fill the development Database with some testing data, run:
```
rails db:seed
```

#### Export PDF
The export uses [wkhtmltopdf](https://wkhtmltopdf.org).
It should be included as a binary gem using bundler.
If this fails, install wkhtmltopdf using your distribution and tell [wicked_pdf](https://github.com/mileszs/wicked_pdf)  where the local installation is.
Tell bundler to install without the binary by running `bundle install --without wk_binary`.

## Deployment

### Setup

### CI/CD

