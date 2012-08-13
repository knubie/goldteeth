# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
benjamin = Artist.create { name: 'Benjamin Bouchet', bio: 'Some bio stuff', image: 'https://s3.amazonaws.com/goldteeth/uploads/artist/image/1/artist.jpg' }
