# require 'pry-byebug'
# require_relative 'sites'

FactoryBot.define do
  factory :bookmark do
    title "test bookmark"
    url   "https://www.reddit.com/r/tightpussy/"
    shortening "https://www.short.com/tp"
    site_id 43289714
  end

  trait :site_with_id do
    # binding.pry
    site_id 3 #FactoryBot.create(:site) 
  end
end
