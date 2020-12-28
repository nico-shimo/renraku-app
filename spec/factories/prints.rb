FactoryBot.define do
  factory :tweet do
    title {Faker::Lorem.word}
    text  {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    association :user
  end
end
