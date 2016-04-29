FactoryGirl.define do
  factory :beauty_place do
    name 'Lotus Lady Spa'
  end

  factory :salon, class: BeautyPlace do
    name 'Vidal Sassoon'
  end
end
