FactoryBot.define do
  factory :buy_information do
    postal_code { '123-4567'}
    place_id { 2 }
    city {'渋谷区'}
    address {'1-1-1'}
    building {'ハイツ101'}
    phone_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
   end
  end