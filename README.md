[![Waffle.io - Columns and their card count](https://badge.waffle.io/le3ah/imagine_challenge.svg?columns=all)](https://waffle.io/le3ah/imagine_challenge)

## Imagine Analytics - Platform Engineer Challenge
This challenge is designed to expose a client's book of business to carrier partners in order to assist with their pursuit of new business.

The data set consists of three tables - Clients, Carriers, and Policies.  These can be referenced in CSV form in this app via ```db/data/carriers.csv```, ```db/data/clients.csv```, & ```db/data/policies.csv```

* Ruby version - 2.4.5

* Rails version - 5.2.3

## Getting Started

To run the Imagine Challenge on your local machine, navigate to the directory in which you would like the project to be located, then execute the following commands:

```
$ git clone
git@github.com:le3ah/imagine_challenge.git
$ cd imagine_challenge
$ bundle
$ rails g rspec:install
$ rails db:create
$ rails db:migrate
```

In order to load the data into a relational database for access by the API endpoints, you should run `bundle exec rake all`

## Deployment

To view this app in development, execute the following command from the project directory: `rails s`. In a browser, visit `localhost:3000`, to view the application.

## API Endpoints

Accessible API index endpoints include the following:

* /api/v1/carriers
* /api/v1/clients
* /api/v1/policies

Searchable endpoints include the following:

* /api/v1/carriers/find?company_name=company name
* /api/v1/clients/find?name=name
* /api/v1/policies/find?company_policy_number=policy number
* /api/v1/policies/find_all?expiration_date=date
* /api/v1/policies/find_all?effective_date=date

To find the total counts of each model, visit the following:

* /api/v1/carriers/total_count
* /api/v1/clients/total_count
* /api/v1/policies/total_count

To find all policies by one client or a client by its id, visit the following respectively:

* /api/v1/clients/:id/policies
* /api/v1/clients/:id

## Pagination

At the time of this application's creation, there are a total of 5,000 clients in the database.  Pagination is possible by modifying the search params.  A sample request with pagination params is as follows: `localhost:3000/api/v1/clients?page=2&per_page=15`
The default page setting is 1 and the default clients per page is 50 if no params are provided.
The total count of clients can be viewed by checking the Headers in your workspace.  I used Postman for viewing my endpoints, and a screenshot of some of my headers is below:

<img width="412" alt="Screen Shot 2019-04-29 at 5 50 26 PM" src="https://user-images.githubusercontent.com/42391567/56933965-5b93b400-6aa7-11e9-9aed-53a2a8820e18.png">

`X-Total-Count` is the total number of clients.
## Gems

I added the following gems for production purposes:
* fast_jsonapi
* awesome_print
* kaminari

Other additional development & test environment gems include the following:
* gem 'rspec-rails'
* gem 'capybara'
* gem 'launchy'
* gem 'pry'
* gem 'shoulda-matchers', '~> 3.1'
* gem 'simplecov'
* gem 'factory_bot_rails'

## Testing

I ran my tests using the command `rspec` and tracked my coverage through `SimpleCov`

<img width="1316" alt="Screen Shot 2019-04-29 at 5 16 44 PM" src="https://user-images.githubusercontent.com/42391567/56933432-12426500-6aa5-11e9-941e-8761440820ee.png">

## Author
[Leah K. Miller](https://github.com/le3ah)
