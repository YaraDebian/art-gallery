FactoryBot.define do
  factory :artwork do
    title { "Sample Artwork" }
    description { "A sample artwork description" }
    year { 2024 }
    image_url { "https://example.com/image.jpg" }
    association :artist
    association :art_movement
  end
end
