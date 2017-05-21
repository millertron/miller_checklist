# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

case Rails.env
when 'development'
	User.create(username: "kohachoji", first_name: "Koha", last_name: "Choji", email: "koha@mutex.com", password: "password123", password_confirmation: "password123", status: :active)
when 'production'
	User.create(username: ENV["PROD_ADMIN_USERNAME"], first_name: ENV["PROD_ADMIN_FNAME"], last_name: ENV["PROD_ADMIN_LNAME"], email: ENV["PROD_ADMIN_EMAIL"], password: ENV['PROD_ADMIN_PASSWORD'], password_confimation: ENV['PROD_ADMIN_PASSWORD'], status: :active)
end