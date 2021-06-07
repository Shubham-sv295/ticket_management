# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user =User.new
@user =User.create(name: 'Shubham Verma',email:'shubhamverma.sv803@gmail.com',mob_no:'9685080084',role: 2,password:'Shubham11',password_confirmation:'Shubham11', provider: "google_oauth2", uid: "117142728563238979600")
@user.save
