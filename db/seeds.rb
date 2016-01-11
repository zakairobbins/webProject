# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'test@example.com', password: 'password', admin: true)

Product.create(title: 'resume', price: 19.99)
Product.create(title: 'coverletter', price: 19.99)
Product.create(title: 'CV', price: 19.99)
