FactoryBot.define do
  factory :museum do
    title                          { Faker::Lorem.sentence }
    place                          { "美術館" }
    genre_id                       { Faker::Number.between(from: 2, to: 12) }
    prefecture_id                  { Faker::Number.between(from: 1, to: 47) }
    artist                         { Faker::Artist.name }
    text                           { Faker::Lorem.sentence }
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
