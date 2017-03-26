# README

## Dependencies

* Ruby version(s) supported: 2.x
* System dependencies: postgresql

## Setup

* Don't forget to install gems: run `bundle install`
* Database creation: run `rake db:create`
* Database initialization: run `rake db:migrate test:prepare`
* Run `User.create!(email: 'test@stackcommerce.com', password: 'test')` in the Rails console to create a user so that you can login!
* To run a local server: `rails server`. Of course, you know this already :)
* How to run the test suite: run `rake test`

## Production

Find the production app here: https://stackbird.herokuapp.com/

Use the following credentials on production to login:

* username: test@stackcommerce.com
* password: test

## Architecture

* I realized that I would be spending way too much time creating the authorization/authentication software, so I used Thoughtbot's great Clearance gem to get the job done.
* I chose to implement a Twitter API system myself. (Otherwise, what's the point of this exercise, right?)
* Twitter::Tweet objects are returned instead of a hash from the Twitter API. I did this in order to have some control over what types of objects get returned. For example, `tweet.created_at` returns a `DateTime` object!
* You'll find that I separated the Twitter::Tweet object from the view representation by using a Decorator class. I consider this type of separaton of concerns *very* important, and is a subject I could go on about at length.
* I did implement 5-minute API call caching, but I don't believe it's working because I didn't implement memcached cache backend for Rails yet on Heroku. We can take care of that in-person if you like. :)

## Design

* I used Bootstrap css/js to simply style the entire site, including menu and basic bootstrap components and layout.
* I chose not to go too deep on UI/UX, although I certainly could have. I wanted to show you a taste of what I can do without going overboard.

## Testing

* I took the path of least resistance and used Minitest instead of RSpec or anything else. I happen to like Minitest, actually!
* I added tests for almost everything. I think the only thing lacking here is acceptance testing (broswer-based testing), but that would have taken me way too long to setup for this takehome project. We'll leave acceptance testing as a project for another day.
* Note that I should have used something like VCR or a mock/stub implementation instead of hitting the Twitter API for the test suite. I decided to sidestep this problem for now, since we're not running a bunch of tests on an integration server or anything. Once again, I didn't want to sink a ton of time on nitty-gritty details.
