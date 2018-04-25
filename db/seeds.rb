Site::delete_all
Bookmark::delete_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  Site.create(top_level_url: "www.#{Faker::Pokemon.name}.com")
end

50.times do
  pokemon = Faker::Pokemon.name
  Bookmark.create(
    title:      "#{pokemon}'s page",
    url:        "www.#{pokemon}.com/#{pokemon}",
    shortening: "www.short.com/#{pokemon}",
    site_id:    rand(0..(Site.all.count))
    )
end