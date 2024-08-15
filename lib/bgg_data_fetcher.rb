# Upon making a custom class for use on a personal project with some 'real' world problems, I do see how this could be
# refactored to be more clean and give each function a singular purpose. I would keep game_search the same, but have
# seperate functions for each piece of information. The conn == 200 and doc == Nokogiri::XML could go into private
# functions. Then the game_details could just call a bunch of these functions and only a single connection was made.
# I will look into refactoring to improve my ruby class skills.

require 'faraday'
require 'nokogiri'

class BggDataFetcher
  BASE_URL = 'https://api.geekdo.com/xmlapi/'.freeze

  def fetch_board_game_rating(game_id)
    conn = Faraday.get("#{BASE_URL}boardgame/#{game_id}?stats=1")

    if conn.status == 200
      doc = Nokogiri::XML(conn.body)
      game_average_rating = doc.at_xpath("//average").text.to_f

      game_average_rating ? game_average_rating.round(1) : nil
    else
      puts "Connection failed for game id: #{conn.status}"
      nil
    end
  end

  def fetch_board_game_search(game_name)
    conn = Faraday.get("#{BASE_URL}search?search=#{game_name}")
    results = []

    if conn.status == 200
      doc = Nokogiri::XML(conn.body)

      doc.xpath("//boardgame").each do |game|
        game_id = game.attr("objectid")
        name = game.xpath("name").text
        year = game.xpath("yearpublished").text

        results << { game_id: game_id, name: name, year: year }
      end

      results
    else
      puts "Connection failed for search: #{conn.status}"
      nil
    end
  end

  def fetch_board_game_image(game_id)
    conn = Faraday.get("#{BASE_URL}boardgame/#{game_id}?stats=1")

    if conn.status == 200
      doc = Nokogiri::XML(conn.body)
      game_image = doc.xpath("//image")

      game_image ? game_image.text : nil
    else
      puts "Connection failed for thumbnail: #{conn.status}"
      nil
    end
  end

  def self.fetch_board_game_details(game_id)
    conn = Faraday.get("#{BASE_URL}boardgame/#{game_id}?stats=1")
    results = []

    if conn.status == 200
      doc = Nokogiri::XML(conn.body)

      doc.xpath("//boardgame").each do |game|
        game_image_url = game.xpath("image").text
        game_thumbnail_url = game.xpath("thumbnail").text
        game_description = game.xpath("description").text

        results << { game_image_url: game_image_url, game_thumbnail_url: game_thumbnail_url, game_description: game_description}
      end
      results
    else
      puts "Connection failed for details: #{conn.status}"
      nil
    end
  end
end
