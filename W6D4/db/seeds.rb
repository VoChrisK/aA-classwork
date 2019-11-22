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
user_4 = User.create(username: 'Walker')
user_5 = User.create(username: 'Mike')
user_6 = User.create(username: 'dddd')

art_1 = Artwork.create(title: 'Yeah', image_url: 'http://www.google.com/yeah', artist_id: user_2[0].id)
art_2 = Artwork.create(title: 'Hello World', image_url: 'http://www.yahoo.com', artist_id: user_3[0].id)
art_3 = Artwork.create(title: 'Hi', image_url: 'http://www.google.com/hi', artist_id: user_4[0].id)
art_4 = Artwork.create(title: 'Ig', image_url: 'https://www.instagram.com/', artist_id: user_1[0].id)

art_share_1 = ArtworkShare.create(artwork_id: art_2[0].id, viewer_id: user_1[0].id)
art_share_2 = ArtworkShare.create(artwork_id: art_3[0].id, viewer_id: user_2[0].id)
art_share_3 = ArtworkShare.create(artwork_id: art_1[0].id, viewer_id: user_3[0].id)
art_share_4 = ArtworkShare.create(artwork_id: art_4[0].id, viewer_id: user_5[0].id)

comment_1 = Comment.create(user_id: user_1[0].id, artwork_id: art_2[0].id, body: 'looks good.')
comment_2 = Comment.create(user_id: user_2[0].id, artwork_id: art_3[0].id, body: 'looks good.')
comment_3 = Comment.create(user_id: user_4[0].id, artwork_id: art_5[0].id, body: 'looks good.')