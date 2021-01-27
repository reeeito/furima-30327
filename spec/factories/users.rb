FactoryBot.define do
    factory :user do
      nickname                  {Faker::Name.name}
      email                 {Faker::Internet.free_email}
      password = Faker::Internet.password(min_length: 6)
      password              {password}
      password_confirmation {password}
      lastname              {"藤原"}
      firstname             {"怜叶"}
      lastname_kana         {"フジワラ"}
      firstname_kana        {"レイト"}
      birthday              {"19960716"}
    end
  end