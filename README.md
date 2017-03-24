# README

Rails application to that enables users to complete regular checklists

* Ruby version: 
2.3.1

* Rails version: 
5.0.1

* Configurations
When installing gems via bundle install/update, for Windows, there will be a problem with bcrypt gem.
So you will have to remove the bcrypt gem, then manually install bcrypt using the following command:
gem 'bcrypt', '~> 3.1.11'

Just as described in the Gemfile

* Database initialization
Development/test environment is configured to user SQLite at the moment as specified in database.yml
Seed contains one user but a secure sign-up process is yet to be implemented to user creation is unrestricted from the front end.

