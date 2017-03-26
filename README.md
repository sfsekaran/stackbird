# README

## Basics
* Ruby version(s) supported: 2.x 
* System dependencies: You must have postgresql installed.
* Configuration: None needed
* Database creation: Run `rake db:create`
* Database initialization: Run `rake db:migrate test:prepare`
* How to run the test suite: Run `rake test`
* Services (job queues, cache servers, search engines, etc.): none!
* Deployment instructions: Deploys to Heroku upon push to GitHub. Easy!

## Architecture

* I realized that I would be spending way too much time creating the authorization/authentication software, so I used Thoughtbot's great Clearance gem to get the job done.
* I chose to implement a Twitter API system myself. (Otherwise, what's the point of this exercise, right?)
* Twitter::Tweet objects are returned instead of a hash from the Twitter API. I did this in order to have some control over what types of objects get returned. For example, `tweet.created_at` returns a `DateTime` object!
* You'll find that I separated the Twitter::Tweet object from the view representation by using a Decorator class.

## Design

* I used Bootstrap css/js to simply style the entire site, including menu and basic bootstrap components and layout.
* I chose not to go too deep on UI/UX, although I certainly could have. I wanted to show you a taste of what I can do without going overboard.

## Testing

* I added tests for almost everything. I think the only thing lacking here is acceptance testing (broswer-based testing), but that would have taken me way too long to setup for this takehome project. We'll leave acceptance testing as a project for another day.

* Note that I should have used something like VCR or a mock/stub implementation instead of hitting the Twitter API for the test suite. I decided to sidestep this problem for now, since we're not running a bunch of tests on an integration server or anything. Once again, I didn't want to sink a ton of time on nitty-gritty details.