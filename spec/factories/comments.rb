FactoryBot.define do
  factory :comment do
    content             { Faker::Lorem.sentence }
    user                { Faker::Lorem.sentence }
    reservation         { Faker::Lorem.sentence }
  end
end