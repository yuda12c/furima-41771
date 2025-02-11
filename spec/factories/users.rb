
require 'faker'

FactoryBot.define do
  factory :user do
    nickname { "テストユーザー" }
    email { Faker::Internet.email }
    password { "password1" }
    password_confirmation { "password1" }
    surname { "山田" }
    name { "太郎" }
    surname_kana { "ヤマダ" }
    name_kana { "タロウ" }
    birthday { "1990-01-01" }
  end
end