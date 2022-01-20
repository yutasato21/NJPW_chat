FactoryBot.define do
  factory :match do
    game_number    { Faker::Number.within(range: 1..20) }
    team_a_player  { Faker::Name.name }
    team_a_player2 { Faker::Name.name }
    team_a_player3 { Faker::Name.name }
    team_a_player4 { Faker::Name.name }
    team_a_player5 { Faker::Name.name }
    team_b_player  { Faker::Name.name }
    team_b_player2 { Faker::Name.name }
    team_b_player3 { Faker::Name.name }
    team_b_player4 { Faker::Name.name }
    team_b_player5 { Faker::Name.name }

    association :room
  end
end
