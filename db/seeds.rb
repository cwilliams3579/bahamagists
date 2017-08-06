# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times { User.create!(first_name: Faker::Name.title, last_name: Faker::Name.last_name, email: Faker::Internet.free_email, password: "password", admin: false) }
5.times { Category.create!(name: Faker::Job.title) }
10.times { Job.create!(title: Faker::Job.title, description: Faker::Lorem.paragraph, company: Faker::Company.name, image: Faker::Company.logo, url: Faker::Internet.url, user:User.first) }
10.times { Post.create!(title: Faker::Name.title, content: Faker::Lorem.paragraph, image: "", user: User.first) }

