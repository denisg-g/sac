# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Document.create(name: 'Boletin', number: 5, status: 1)
Document.create(name: 'C. Notas', number: 5, status: 1)
Document.create(name: 'Foto x3', number: 5, status: 1)
Document.create(name: 'P nacimiento', number: 5, status: 1)
Document.create(name: 'Carta Conducta', number: 5, status: 1)
 user = User.create(email:"denis@web.com",password:"asdfasdf",tipo:"Admin")
 user = User.create(email:"aaron@web.com", password:"bdpm1234",tipo:"Admin")
 user = User.create(email:"darling@web.com", password:"tuma1234", tipo:"Admin")
 user = User.create(email:"userguess@web.com", password:"esteban1234", tipo:"Admin")
# user.save!
