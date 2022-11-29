# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end

# puts "plant " + plants
Product.delete_all
Category.delete_all
4.times do
  categories = Category.create(name:        Faker::Game.genre,
                               description: Faker::Quote.famous_last_words,
                               size:        Faker::Number.number(digits: 2))
  next unless categories && categories.valid?

  25.times do
    plants = categories.products.find_or_create_by(
      name:        Faker::Games::LeagueOfLegends.champion,
      price:       Faker::Number.decimal(l_digits: 2),
      size:        Faker::Number.number(digits: 2),
      description: Faker::Quote.famous_last_words,
      image:       Faker::Quote.famous_last_words,
      stock:       Faker::Number.number(digits: 2),
      sale:        false
    )
  end
end

# Page.create(
#   title: 'About the data',
#   content: 'The data powering this awesome website was taken from Kaggle.',
#   permalink: 'about_the_data'

# )
# Page.create(
#   title: 'Contact us',
#   content: 'Read out to me if you want to discuss coding, or just life :)',
#   permalink: 'contact'

# )

# filename = Rails.root.join("db/top_movies.csv")
# puts "Loading Movies from the csv file: #{filename}"

# csv_data = File.read(filename)
# movies = CSV.parse(csv_data, headers:true, encoding: "utf-8")

# movies.each do  | m |
#   production_company = ProductionCompany.find_or_create_by(name: m["production_company"])
#   if production_company && production_company.valid?
#     #create a movie
#     movie = production_company.movies.create(
#       title:        m["original_title"],
#       year:         m["year"],
#       duration:     m["duration"],
#       description:  m["description"],
#       average_vote: m["avg_vote"]
#     )
#     puts "Invalid Movie #{m['original_title']}" unless movie&.valid?

#     #genres
#     genres = m["genre"].split(",").map(&:strip)

#     genres.each do |genre_name|
#       genre = Genre.find_or_create_by(name: genre_name)

#       MovieGenre.create(movie: movie, genre: genre)
#     end
#   else
#     puts "invalid production company #{m["production_company"]} for movie #{m['original_title']}"
#   end
#   #puts m['original_title']
# end
# puts "Created #{ProductionCompany.count} Production Companies"
# puts "Created #{Movie.count} movies."
# puts "Created #{Genre.count} Genres"
# puts "Created #{MovieGenre.count} MovieGenres"
