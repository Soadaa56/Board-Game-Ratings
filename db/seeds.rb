# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(email: "test@example.com",
            password: "password",
            password_confirmation: "password",
            name: "Tester")


Post.create(title: "Sniper Elite: The Board Game",
            body: "Sniper Elite: The Board Game is a hidden movement game based on the iconic video game series.  In the game, one player takes the role of the sniper, who is trying to make their way past the German guards by stealth or violence. Up to three other players control squads of German soldiers, striking a balance between defending their objectives and hunting the sniper.  Sniper Elite features a bag-manipulation element. The sniper draws chits from a bag to target the defenders, though canny defense can decrease the sniper's likelihood of making their shot...  &mdash;description from the publisher  ",
            user_id: User.first.id,
            bgg_rating: 7.8,
            image_pin: "https://cf.geekdo-images.com/gGDwoohdi6ky6Z3EZfpz3g__original/img/KGJc5bom6JEZuojfu3TqAJ7BUpM=/0x0/filters:format(jpeg)/pic6863775.jpg",
            bgg_id: 295262,
            thumbnail: "https://cf.geekdo-images.com/gGDwoohdi6ky6Z3EZfpz3g__thumb/img/Srxptd_xiygDumqiPqR0d2OdIY4=/fit-in/200x150/filters:strip_icc()/pic6863775.jpg")

Post.create(title: "Puerto Rico",
            body: "In Puerto Rico, players assume the roles of colonial governors on the island of Puerto Rico. The aim of the game is to amass victory points by shipping goods to Europe or by constructing buildings. Each player uses a separate small board with spaces for city buildings, plantations, and resources. Shared between the players are three ships, a trading house, and a supply of resources and doubloons. The resource cycle of the game is that players grow crops which they exchange for points or doubloons. Doubloons can then be used to buy buildings, which allow players to produce more crops or give them other abilities. Buildings and plantations do not work unless they are manned by colonists. During each round, players take turns selecting a role card from those on the table (such as &quot;Trader&quot; or &quot;Builder&quot;). When a role is chosen, every player gets to take the action appropriate to that role. The player that selected the role also receives a small privilege for doing so - for example, choosing the &quot;Builder&quot; role allows all players to construct a building, but the player who chose the role may do so at a discount on that turn. Unused roles gain a doubloon bonus at the end of each turn, so the next player who chooses that role gets to keep any doubloon bonus associated with it. This encourages players to make use of all the roles throughout a typical course of a game. Puerto Rico uses a variable phase order mechanism in which a &quot;governor&quot; token is passed clockwise to the next player at the conclusion of a turn. The player with the token begins the round by choosing a role and taking the first action. Players earn victory points for owning buildings, for shipping goods, and for manned &quot;large buildings.&quot; Each player's accumulated shipping chips are kept face down and come in denominations of one or five. This prevents other players from being able to determine the exact score of another player. Goods and doubloons are placed in clear view of other players and the totals of each can always be requested by a player. As the game enters its later stages, the unknown quantity of shipping tokens and its denominations require players to consider their options before choosing a role that can end the game. In 2011 and mostly afterwards, Puerto Rico was published to include both Puerto Rico: Expansion I &ndash; New Buildings and Puerto Rico: Expansion II &ndash; The Nobles. These versions are included in the other game entry Puerto Rico, not this regular game entry for Puerto Rico. Some editions of Puerto Rico list the player count as 2-5 instead of 3-5, and they include variant rules for games with only two players.",
            user_id: User.first.id,
            bgg_rating: 7.9,
            image_pin: "https://cf.geekdo-images.com/QFiIRd2kimaMqTyWsX0aUg__original/img/DOgIp57F7tKZvxeITGAd3e_Q9as=/0x0/filters:format(jpeg)/pic158548.jpg",
            bgg_id: 3076,
            thumbnail: "https://cf.geekdo-images.com/QFiIRd2kimaMqTyWsX0aUg__thumb/img/5fLo89ChZH6Wzukk36bhZ-EpBS0=/fit-in/200x150/filters:strip_icc()/pic158548.jpg")

Post.create(title: "Power Grid",
            body: "Power Grid is the updated release of the Friedemann Friese crayon game Funkenschlag. It removes the crayon aspect from network building in the original edition, while retaining the fluctuating commodities market like Crude: The Oil Game and an auction round intensity reminiscent of The Princes of Florence.  The objective of Power Grid is to supply the most cities with power when someone's network gains a predetermined size.  In this new edition, players mark pre-existing routes between cities for connection, and then bid against each other to purchase the power plants that they use to power their cities.  However, as plants are purchased, newer, more efficient plants become available, so by merely purchasing, you're potentially allowing others access to superior equipment.  Additionally, players must acquire the raw materials (coal, oil, garbage, and uranium) needed to power said plants (except for the 'renewable' windfarm/ solar plants, which require no fuel), making it a constant struggle to upgrade your plants for maximum efficiency while still retaining enough wealth to quickly expand your network to get the cheapest routes.  ☛ Power Grid FAQ - Please read this before posting a rules question!  Many questions are asked over and over in the forums... If you have a question about a specific expansion, please check the rules forum or FAQ for that particular expansion.  ",
            user_id: User.first.id,
            bgg_rating: 7.8,
            image_pin: "https://cf.geekdo-images.com/yd6LuatytHRhcFCxCf-EEg__original/img/OS13C6W4i1XW__wWVVVaqF7BV0c=/0x0/filters:format(jpeg)/pic4459753.jpg",
            bgg_id: 2651,
            thumbnail: "https://cf.geekdo-images.com/yd6LuatytHRhcFCxCf-EEg__thumb/img/jWTonZ5oYNlPzpELKHIJGWSS0Y8=/fit-in/200x150/filters:strip_icc()/pic4459753.jpg")
