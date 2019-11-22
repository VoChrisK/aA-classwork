# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(username: 'Chris')
user_2 = User.create(username: 'Johnson')
user_3 = User.create(username: 'Ronil')

art_1 = Artwork.create(title: 'Yeah', image_url: 'http://www.google.com', artist_id: 2)
art_2 = Artwork.create(title: 'Hello World', image_url: 'http://www.yahoo.com', artist_id: 3)

art_share_1 = ArtworkShare.create(artist_id: 2, viewer_id: 1)
art_share_2 = ArtworkShare.create(artist_id: 3, viewer_id: 1)