ArtworkShare.destroy_all
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


