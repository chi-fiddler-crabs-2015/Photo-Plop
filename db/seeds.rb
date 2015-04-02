# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create!(username:"teamPhotoplop", email: "photoplop@gmail.com", password:"caballo")
mega_album = Album.create!(title: "MEGA Album", creator: admin, vanity_url:"MEGA-album", tag: "photoplop")