FactoryBot.define do
  factory :room do
    name { Faker::Name.name }
    text { Faker::Lorem.sentence }

    association :user
  end
end
