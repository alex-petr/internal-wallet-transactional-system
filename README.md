# Internal wallet transactional system test task

## Goal: Internal wallet transactional system (with a front end)

## Requirements:
- Based on relationships every entity e.g. User, Team, Stock or any other should have their own defined “wallet”
to which we could transfer money or withdraw
- Every request for credit/debit (deposit or withdraw) should be based on records in database for given model
- Every instance of a single transaction should have proper validations against required fields and their source
and target wallet, e.g. from who we are taking
money and transferring to whom? (Credits == source wallet == nil, Debits == target wallet == nil)
- Each record should be created in database transactions to comply with ACID standards
- Balance for given entity (User, Team, Stock) should be calculated by summing records

## Tasks:
1. Architect generic wallet solution (money manipulation) between entities (User, Stock, Team or any other)
2. Create model relationships and validations for achieving proper calculations of every wallet, transactions
3. Use STI (or any other design pattern) for proper money manipulation

## Application must consists of:
- Back-end (preferably Rails) + tests of business logic: validations, operations, edge-cases (preferably RSpec)
- Front-end (any framework)

# Application architecture: Entity–relationship model

```
┌─────────────────────────────────────────────────┐
│ User (Devise)                                   │
│─────────────────────────────────────────────────│
│ PK id integer NOT NULL                          │
│ email char(100) NOT NULL, UNIQUE CONSTRAINT     │
│ role = person | team | stock - integer NOT NULL │
└─────────────────┬───────────────────────────────┘
                  │
                  │ 1:1
                  ▼
┌───────────────────────────────────────────────────┐
│ Wallet                                            │
│───────────────────────────────────────────────────│
│ PK id integer NOT NULL                            │
│ FK user_id integer NOT NULL                       │
│ balance float (cumulative after each transaction) │
└─────────────────┬─────────────────────────────────┘
                  │
                  │ 1 mandatory:many optional
                  ▼
┌───────────────────────────────────────────────────┐
│ Transaction                                       │
│───────────────────────────────────────────────────│
│ PK id integer NOT NULL                            │
│ FK1 source_wallet_id integer NOT NULL             │
│ FK2 target_wallet_id integer NOT NULL             │
│ amount float NOT NULL                             │
│ created_at datetimez NOT NULL                     │
└───────────────────────────────────────────────────┘
```

## Technologies

- [Puma](https://github.com/puma/puma) as simple, fast, multi-threaded server for Ruby/Rack applications
- [Rake](https://github.com/ruby/rake) – Ruby Make, make-like build utility for Ruby
- All required gems installed with [Bundler gem manager](https://bundler.io/)
- [Devise](https://github.com/heartcombo/devise) - Flexible authentication solution for Rails with Warden. 
- [Letter Opener](https://github.com/ryanb/letter_opener) - Preview mail in the browser instead of sending.
- Testing: 
  - [RSpec](https://rspec.info/) - testing tool for TDD/BDD
  - [rspec-rails](https://github.com/rspec/rspec-rails) - RSpec testing framework for Ruby on Rails
  - [Fuubar](https://github.com/thekompanee/fuubar) - instafailing RSpec formatter that uses a progress bar instead of a string of letters and dots as feedback.
  - [factory_bot](https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md), [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) - fixtures replacement with a straightforward definition
    syntax, support for multiple build strategies (saved instances, unsaved
    instances, attribute hashes, and stubbed objects), and support for multiple
    factories for the same class (`user`, `admin_user`, and so on), including factory
    inheritance + provides Rails integration.
  - [Faker](https://github.com/faker-ruby/faker) - A library for generating fake data such as names, addresses, and phone numbers.
  - [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) - Simple one-liner tests for common Rails functionality.
- Debug: [Awesome Print](https://github.com/awesome-print/awesome_print) - Pretty print your Ruby objects with style -- in full color and with proper indentation
- Code style is provided via [RuboCop](https://github.com/rubocop/rubocop)
- **TODO: add more**

## Requirements

- System: Linux, Mac
- Git
- SQLite3
- Node.js
- Yarn
- Ruby version manager (`rbenv` or `RVM`)
- Ruby 3.0.2
- Bundler
- Gems installed via Bundler Gemfile

## Installation

### Download code from repository

Clone with SSH (or HTTPS):

```bash
$ git clone git@github.com:alex-petr/internal-wallet-transactional-system.git internal_wallet_transactional_system
```

### Update the packages (formulae) and Homebrew itself

```bash
$ cd internal_wallet_transactional_system/ && brew update && brew upgrade ; brew cleanup
```

### rbenv (for macOS)

```bash
$ brew install rbenv
```

### Ruby

```bash
$ rbenv install 3.0.2
```

### Install `Bundler` and all required gems

```bash
$ gem install bundler && bundle
```

### Install front-end packages

```bash
$ yarn install
```

### Run all pending migrations

```bash
$ rails db:migrate && rails db:migrate RAILS_ENV=test
```

### Create seed data from db/seeds.rb

```bash
$ rails db:seed
```

### TODO: add NVM/NPM/NodeJS
### TODO: add database setup (create/add seeds data)

## Configuration

### TODO: add info about `.env` files

## Run application

### Start Rack & Puma web application

```bash
# On default 3000 port:
$ rails s

# With customized port (-p, --port PORT):
$ rails s -p 5000
```

#### Navigate to any of these URLs:

- http://lvh.me:3000
- http://localhost:3000
- http://127.0.0.1:3000

## Run tests

```bash
# Default: Run all spec files (i.e., those matching spec/**/*_spec.rb)
$ rspec

# Run all spec files in a single directory (recursively)
$ rspec spec/services

# Run a single spec file
$ rspec spec/services/some_service_spec.rb
```

## TODOs for further improvement
- [ ] Migrate to MySQL or PostgreSQL
- [ ] Add Brakeman, RubyCritic
- [ ] Add annotate, dotenv-rails, pry-byebug
- [ ] Improve Readme
- [ ] Move transaction operations to Sidekiq background workers
- [ ] Add CI (Drone.io, Circle CI etc): RuboCop, RSpec, Brakeman
- [ ] Add errors monitoring system (Rollbar, Sentry, Airbrake etc)
- [ ] Add Cucumber/Capybara feature tests
- [ ] Migrate to Rails JSON API and remove views to separated repo
- [ ] Migrate from custom Rails API to Grape API / Swagger
- [ ] Add RailsMoney gem
