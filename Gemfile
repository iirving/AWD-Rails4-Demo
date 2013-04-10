source 'https://rubygems.org'
ruby "2.0.0"    #currenlty required to run rails4 on Heroku

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

gem 'rails', '4.0.0.beta1'

gem 'heroku'

group :development do
	gem "coderay", "~> 1.0.9"
 # gem "brice", "~> 0.2.6"  # Extra cool IRb goodness for the masses there is a ~/.irbrc file
 gem "wirb"
 gem 'irbtools', :require => false
# gem "irbtools-more", "~> 1.4.0"  # requires gem "drx", "~> 0.4.5" which is not installing :(

end

# guard related gems > to run $guard start
group :development, :tools, :test do
  gem 'guard'
  gem 'growl'
  gem 'guard-livereload'
  gem 'guard-rails'
  gem 'guard-bundler'
  gem "rb-fsevent", "~> 0.9.3"
#  gem "growl_notify", "~> 0.0.3"
end
#auto test related > see .autotest fiel for costumization >> to run $autotest
group :development do
  gem 'ZenTest'
  gem 'autotest-rails'
  gem 'autotest-growl'
  gem 'autotest-fsevent'
#  gem 'gem install redgreen'
end

#testing for Rspec, Cucumber, Test::Unit https://github.com/sporkrb http://spork.rubyforge.org/
#as of march 11 not working with R4
#group :development, :test do
#	gem 'spork-rails'
#  gem  'spork-testunit’
#   gem 'guard-spork
#end


# sqllite in dev and postgrel in prod
group :development do
  gem 'sqlite3'
end


group :production do
  gem "pg", "~> 0.15.1"
  gem 'unicorn'
 # gem 'rails3_serve_static_assets' , github: 'heroku/rails3_serve_static_assets.git'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

# To use ActiveModel has_secure_password
gem "bcrypt-ruby", "~> 3.0.1"

# Use unicorn as the app server


# Deploy with Capistrano
# gem 'capistrano', group: :development

# To use debugger
# gem 'debugger'
