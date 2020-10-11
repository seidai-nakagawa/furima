FactoryBot.define do

  factory :item do
    name                {"abe"}
    explanation         {"aaaaa"}
    size_id             {2}
    state_id            {1}
    shipping_charge_id  {1}
    shipping_date_id    {1}
    prefecture_id       {1}
    price               {3000}
    user
    category
    # //上記2つはitemに対するuserとcategoryのアソシエーション//


    after(:build) do |item|
      item.item_images << FactoryBot.build(:item_image, item: item)
    end  
  end

  factory :item_image do
    url { Rack::Test::UploadedFile.new(File.join(Rails.root, "/public/images/test_image.jpg"), 'image/jpg') }
  end  

end

