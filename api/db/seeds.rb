# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Art Movements
renaissance = ArtMovement.create!(
  name: "Renaissance",
  description: "A period of European cultural, artistic, political and economic 'rebirth' following the Middle Ages.",
  period: "14th-17th century"
)

impressionism = ArtMovement.create!(
  name: "Impressionism",
  description: "A 19th-century art movement characterized by relatively small, thin, yet visible brush strokes, open composition, emphasis on accurate depiction of light in its changing qualities.",
  period: "19th century"
)

cubism = ArtMovement.create!(
  name: "Cubism",
  description: "An early-20th-century avant-garde art movement that revolutionized European painting and sculpture, and inspired related movements in music, literature and architecture.",
  period: "Early 20th century"
)

# Create Artists
leonardo = Artist.create!(
  name: "Leonardo da Vinci",
  biography: "Leonardo da Vinci was an Italian polymath of the High Renaissance who was active as a painter, draughtsman, engineer, scientist, theorist, sculptor, and architect.",
  birth_date: "1452-04-15",
  death_date: "1519-05-02"
)

monet = Artist.create!(
  name: "Claude Monet",
  biography: "Claude Monet was a French painter and founder of impressionist painting who is seen as a key precursor to modernism.",
  birth_date: "1840-11-14",
  death_date: "1926-12-05"
)

picasso = Artist.create!(
  name: "Pablo Picasso",
  biography: "Pablo Picasso was a Spanish painter, sculptor, printmaker, ceramicist and theatre designer who spent most of his adult life in France.",
  birth_date: "1881-10-25",
  death_date: "1973-04-08"
)

# Create Artworks
Artwork.create!(
  title: "Mona Lisa",
  description: "The Mona Lisa is a half-length portrait painting by Italian artist Leonardo da Vinci. Considered an archetypal masterpiece of the Italian Renaissance, it has been described as 'the best known, the most visited, the most written about, the most sung about, the most parodied work of art in the world'.",
  year: 1503,
  image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/687px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg",
  artist: leonardo,
  art_movement: renaissance
)

Artwork.create!(
  title: "Water Lilies",
  description: "Water Lilies is a series of approximately 250 oil paintings by French Impressionist Claude Monet. The paintings depict his flower garden at his home in Giverny, and were the main focus of his artistic production during the last thirty years of his life.",
  year: 1916,
  image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Claude_Monet_-_Water_Lilies_-_Google_Art_Project.jpg/1280px-Claude_Monet_-_Water_Lilies_-_Google_Art_Project.jpg",
  artist: monet,
  art_movement: impressionism
)

Artwork.create!(
  title: "Les Demoiselles d'Avignon",
  description: "Les Demoiselles d'Avignon is a large oil painting created in 1907 by the Spanish artist Pablo Picasso. The work, part of the permanent collection of the Museum of Modern Art, portrays five nude female prostitutes from a brothel on Carrer d'Avinyó in Barcelona.",
  year: 1907,
  image_url: "https://upload.wikimedia.org/wikipedia/en/4/4c/Les_Demoiselles_d%27Avignon.jpg",
  artist: picasso,
  art_movement: cubism
)
