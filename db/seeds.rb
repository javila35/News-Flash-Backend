# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bookmark.delete_all
User.delete_all

User.create(username: "joe", password: "joe123456", first_name: "Joe", location: "Seattle", twitter: "coderjoe206")
User.create(username: "user2", password: "12345678")