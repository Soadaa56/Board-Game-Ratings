# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Post.create(title: "Sniper Elite: The Board Game", body: "Hidden movement game, 1 vs 3.", rating: "9")
Post.create(title: "Code Names", body: "Team vs Team word game", rating: "8")
Post.create(title: "Puerto Rico", body: "One of the original worker placement games", rating: "8")
Post.create(title: "Sheriff of Nottingham", body: "Free for all game of deception and negotiation.", rating: "7")
Post.create(title: "Power Grid", body: "Free for all game with bidding and cutthroat area control, similar to ticket to ride", rating: "9")
