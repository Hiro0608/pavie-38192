FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.unique.email }
    password              { '1a' + Faker::Internet.unique.password(min_length: 6) }
    password_confirmation { password }
    family_name           {"苗字"}
    family_name_kana      {"ミョウジ"}
    first_name            {"名前"}
    first_name_kana       {"ナマエ"}
    birth_date            { Faker::Date.birthday }
  end
end