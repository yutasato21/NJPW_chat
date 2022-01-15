FactoryBot.define do
  factory :room do
    name { Faker::Name.name }
    text { Faker::Lorem.sentence }

    association :user

    after(:build) do |room|
      room.image.attach(io: File.open('public/images/家.jpg'), filename: '家.jpg')
    end
  end
end
