require 'faker'
FactoryGirl.define do
  factory :tag do |f|
    f.name Faker::Name.title
  end
end
