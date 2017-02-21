# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Transaction.destroy_all

u1 = User.create! email: "user1@users.com", first_name: "Alan", last_name: "Smith", user_level: false, password: "password", password_confirmation: "password"
u2 = User.create! email: "user12@users.com", first_name: "Becky", last_name: "Vantra", user_level: false, password: "password", password_confirmation: "password"
u3 = User.create! email: "user3@users.com", first_name: "Emily", last_name: "Ecclestone", user_level: false, password: "password", password_confirmation: "password"
u4 = User.create! email: "charlie.gavins@neonseed.com", first_name: "Charlie", last_name: "Gavins", user_level: true, password: "password", password_confirmation: "password"


t1 = Transaction.create!(message: "I love your work", amount: 0.1, payment_status:"recieved", recipient_url:"https://open.spotify.com/artist/6eUKZXaKkcviH0Ku9w2n3V", recipient_name:"Ed Sheeran")
t2 = Transaction.create!(message: "Keep it up dude!", amount: 0.15, payment_status:"recieved", recipient_url:"https://open.spotify.com/artist/4dpARuHxo51G3z768sgnrY", recipient_name:"Adele")
t3 = Transaction.create!(message: "great tunes", amount: 0.2, payment_status:"recieved", recipient_url:"https://open.spotify.com/artist/3OsRAKCvk37zwYcnzRf5XF", recipient_name:"Moby")

u1.transactions << t1
u2.transactions << t2
u3.transactions << t3
