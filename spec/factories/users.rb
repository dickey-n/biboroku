FactoryBot.define do
  factory :user do
    email                            { Faker::Internet.free_email }
    password                         { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation            { password }
    name                             { Faker::Name.initials(number: 2) }
    profile                          {"Hello World"}
  end
end