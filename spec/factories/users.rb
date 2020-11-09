FactoryBot.define do
  factory :user do
    email                            { Faker::Internet.free_email }
    password                         { 'aaaaaa11' }
    password_confirmation            { password }
    name                             { Faker::Name.initials(number: 2) }
    profile                          { 'Hello World' }

    trait :with_picture do
      image { File.new("#{Rails.root}/public/images/test_image.png") }
    end
  end
end
