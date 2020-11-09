FactoryBot.define do
  factory :memo do
    memo { Faker::Lorem.sentence }
    museum
    user
  end
end
