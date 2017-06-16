source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

group :production do
  gem 'pg'
end

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-bootstrap-rails-asset'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password

#use to manage environment variables via config/application.yml - use 'bundle exec figaro install' to initialize
gem "figaro"

#IMPORTANT FOR WINDOWS DEV!!!!!
# run 'gem install bcrypt --platform=ruby' manually
# every time bundle install is run, uninstall the version with x64 suffix
gem 'bcrypt', '~> 3.1.11'

#pundit for authorization - initialize with 'rails g pundit:install'
gem 'pundit', '~> 1.1'

gem 'active_model_serializers'

gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'sqlite3'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  
  #from https://cucumber.io/docs/reference/rails
  gem 'cucumber-rails', :require => false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem "factory_girl_rails"
  
  gem 'shoulda', '~> 3.5'
  gem 'shoulda-matchers', '~> 2.0'
  
  #used to make page navigation
  gem 'capybara', '~> 2.5'
  
  gem 'rails-controller-testing'
  gem 'simplecov', :require => false, :group => :test
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
