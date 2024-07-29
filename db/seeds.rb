# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(email: "Kevinduffy615@gmail.com",
            password: "password",
            password_confirmation: "password",
            name: "Soadaa",
            role: User.roles[:admin])
User.create(email: "test@example.com",
            password: "password",
            password_confirmation: "password",
            name: "Tester")


Post.create(title: "Sniper Elite: The Board Game",
            body: "Asymmetric hidden movement game 1 vs 3",
            user_id: User.first.id)
Post.create(title: "Code Names",
            body: "Team vs Team word game",
            user_id: User.first.id)
Post.create(title: "Puerto Rico",
            body: "One of the original worker placement games",
            user_id: User.first.id)
Post.create(title: "Sheriff of Nottingham",
            body: "Free for all game of deception and negotiation",
            user_id: User.first.id)
Post.create(title: "Power Grid",
            body: "Free for all game with bidding and cutthroat area control, similar to ticket to ride",
            user_id: User.first.id)
