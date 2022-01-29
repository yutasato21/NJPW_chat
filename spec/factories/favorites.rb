FactoryBot.define do
  factory :favorite do
    fav_team   { Faker::Name.name }
    fav_player { Faker::Name.name }

    association :user
  end
end
