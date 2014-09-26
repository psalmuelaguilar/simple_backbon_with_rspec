require 'faker'
FactoryGirl.define do

  factory :posttag do |f|
    f.post_id 1
    f.tag_id 1
  end
end
