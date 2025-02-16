FactoryBot.define do
  factory :item do
    title { 'Example Title' }
    detail { 'Example Detail' }
    category_id { 2 }
    state_id { 2 }
    delivery_id { 2 }
    place_id { 2 }
    dispatch_id { 2 }
    price { 1000 }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/test_image.png'), 'image/png') }
    # その他の属性
  end
end