# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times { User.create!(first_name: Faker::Name.title, last_name: Faker::Name.last_name, email: Faker::Internet.free_email, password: "password", admin: false) }
5.times { Category.create!(name: Faker::Job.title) }
5.times { Post.create!(title: Faker::Name.title, content: Faker::Lorem.paragraph, image: "", user: User.first) }

Job.create! title: "Web Developer", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", company: "Front End Devs", url: "http://www.frontenddevs.com", user:User.first, category_ids: 1