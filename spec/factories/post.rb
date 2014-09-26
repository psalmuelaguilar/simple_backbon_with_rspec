require 'faker'
FactoryGirl.define do
  factory :post do |f|
    f.title Faker::Name.title
    f.content "Lorem Ipsum"
    f.author_id 1
  end
end
