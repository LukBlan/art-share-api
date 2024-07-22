ArtworkShare.destroy_all
Like.destroy_all
Comment.destroy_all
Artwork.destroy_all
User.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

messi = User.create(username: "messi")
aguero = User.create(username: "aguero")
palermo = User.create(username: "palernmo")
ronaldo = User.create(username: "ronaldo")

another = Artwork.create(title: "Anotoher one", artist_id: palermo.id, image_url: "random_img")
example = Artwork.create(title: "Example", artist_id: messi.id, image_url: "random")
test = Artwork.create(title: "Test", artist_id: messi.id, image_url: "random")

ArtworkShare.create!(artwork_id: example.id, viewer_id: ronaldo.id)
ArtworkShare.create!(artwork_id: example.id, viewer_id: aguero.id)
ArtworkShare.create!(artwork_id: another.id, viewer_id: aguero.id)
ArtworkShare.create!(artwork_id: test.id, viewer_id: aguero.id)

comment1 = Comment.create(user_id: aguero.id, artwork_id: another.id, body: "Bad art")
comment2 = Comment.create(user_id: ronaldo.id, artwork_id: another.id, body: "Bad art")
comment3 = Comment.create(user_id: aguero.id, artwork_id: test.id, body: "Bad art")

Like.create(likeable_id: another.id, user_id: ronaldo.id, likeable_type: "Artwork")
Like.create(likeable_id: another.id, user_id: aguero.id, likeable_type: "Artwork")
Like.create(likeable_id: comment1.id, user_id: ronaldo.id, likeable_type: "Comment")
Like.create(likeable_id: comment2.id, user_id: ronaldo.id, likeable_type: "Comment")
