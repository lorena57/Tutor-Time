# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create!(username: "Lorena",
             email: "lorena@lorena.com",
             password: "password",
             admin: true
             )

# Generate a bunch of additional users.
10.times do |n|
  username  = Faker::Internet.username
  email = Faker::Internet.email
  password = "password"
  Student.create!(username:  username,
               email: email,
               password: password)
end

# students = Student.take(6)

# 11.times do
#   appointment_time = '24 Sep 2014'
#   students.each { |student| student.appointments.create!(appointment_time: appointment_time)}
# end

