AWD Rails4 Demo
=========
This is a  Rails 4 beta, Ruby 2 DEMO APP, [Demo the App](http://awd4.herokuapp.com)
[![Code Climate](https://codeclimate.com/github/iirving/AWD-Rails4-Demo.png)](https://codeclimate.com/github/iirving/AWD-Rails4-Demo)

It is based on the Depot app of [Agile Web Development with Rails (4th edition)](http://pragprog.com/book/rails4/agile-web-development-with-rails) published by The Pragmatic Bookshelf.  Good Stuff, buy it now!

As of April 2013 both the book and the framework are in beta.  Where the code, functionally deviates from that presented in the book is entirely my fault - really.

### Ruby version : 2.0.0
### Rails version : 4.0.0.beta1
========= 
# Configuration

after cloning this repo run bundle, to install the required gems, for gods sake use RMV to create a per-project gemset.

    $bundle

# Database initialization
    $rake db:setup

or to just populate it try :

    $rake db:seed

# start the app in development
I'm using the Guard gem to do Automate at bunch of things like : livereload (hooks into a Chrome plug-in), Bundle, and recompliing assets, and then hooking it into Growl for notifications. to start the guard process do :

    $guard start

# Tests
currently having promblems running guard-test so I've fallen back to AutoTest (running in yet another terminal)

    $autotest

# See it in DEMO:

it is deployed on Heroku, on free hamster mode, (http://awd4.herokuapp.com) for your amusement and torture testing.