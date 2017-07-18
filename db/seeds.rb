# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create! first_name: "Snoop", last_name: "Dogg", email: "snoop@gmail.com", password: "password", admin: true
# User.create! first_name: "Sean", last_name: "Paul", email: "sean@gmail.com", password: "password", admin: false
Category.create! name: "Web Development"
Job.create! title: "Web Developer", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", company: "Front End Devs", url: "http://www.frontenddevs.com", user:User.first, category_ids: 1