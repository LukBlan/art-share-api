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

another = Artwork.create(title: "Anotoher one", artist_id: palermo.id, image_url: "random_img", favorite: false)
example = Artwork.create(title: "Example", artist_id: messi.id, image_url: "random", favorite: false)
test = Artwork.create(title: "Test", artist_id: messi.id, image_url: "random", favorite: false)

ArtworkShare.create!(artwork_id: example.id, viewer_id: ronaldo.id, favorite: false)
ArtworkShare.create!(artwork_id: example.id, viewer_id: aguero.id, favorite: false)
ArtworkShare.create!(artwork_id: another.id, viewer_id: aguero.id, favorite: false)
ArtworkShare.create!(artwork_id: test.id, viewer_id: aguero.id, favorite: false)

comment1 = Comment.create(user_id: aguero.id, artwork_id: another.id, body: "Bad art")
comment2 = Comment.create(user_id: ronaldo.id, artwork_id: another.id, body: "Bad art")
comment3 = Comment.create(user_id: aguero.id, artwork_id: test.id, body: "Bad art")

Like.create(likeable_id: another.id, user_id: ronaldo.id, likeable_type: "Artwork")
Like.create(likeable_id: another.id, user_id: aguero.id, likeable_type: "Artwork")
Like.create(likeable_id: comment1.id, user_id: ronaldo.id, likeable_type: "Comment")
Like.create(likeable_id: comment2.id, user_id: ronaldo.id, likeable_type: "Comment")

random_one = Collection.create(name: "Random One", user_id: ronaldo.id)
another_collection = Collection.create(name: "Another Collection", user_id: ronaldo.id)

ArtworkCollection.create(collection_id: random_one.id, artwork_id: another.id)
ArtworkCollection.create(collection_id: random_one.id, artwork_id: example.id)
ArtworkCollection.create(collection_id: another_collection.id, artwork_id: another.id)
ArtworkCollection.create(collection_id: another_collection.id, artwork_id: example.id)