FactoryGirl.define do
  factory :review do
    movie
    email "email@example.com"
    rating 4
    comment "Best movie ever!"
  end
end