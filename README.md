# Backend

Test backend service

## Prerequisites

You will need the following things properly installed on your computer.

* [Ruby] (version: 2.5.3)
* [Redis]
* [Postgresql]

## Configuration

* `git clone <repository-url>` this repository
* `cd Backend`

Set your redis values (or uncomment for default) on `config/cable.yml`:

* `url` (default: `redis://localhost:6379/1`)

Set your Postgresql values (or uncomment for default) on `config/database.yml`:

* `host` (default: `localhost`)
* `port` (default: `5432`)
* `username`
* `password`

## Installation

* `bundle install`
* `rails db:setup`

## Running / Development

Running server:
* `rails s`

Running random sales generator script (will run until stopped):
* `rake sales:random`
