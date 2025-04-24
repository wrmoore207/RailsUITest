# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# add our categories to the forum
categories = [
  { name: "Volunteering",       slug: "volunteering",       color: "FF5733" },
  { name: "Free Resources",      slug: "free-resources",     color: "33FF57" },
  { name: "Classes",             slug: "classes",            color: "3357FF" },
  { name: "Events",              slug: "events",             color: "FF33A8" },
  { name: "Opportunities",       slug: "opportunities",      color: "33FFF5" },
  { name: "Community News",      slug: "community-news",     color: "F5FF33" }
]

categories.each do |category_attrs|
  ForumCategory.find_or_create_by!(slug: category_attrs[:slug]) do |category|
    category.name  = category_attrs[:name]
    category.color = category_attrs[:color]
  end
end

puts "Created #{ForumCategory.count} forum categories."
