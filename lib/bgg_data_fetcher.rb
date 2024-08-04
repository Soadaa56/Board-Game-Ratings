require 'faraday'
require 'nokogiri'

class BggDataFetcher
  BASE_URL = 'https://api.geekdo.com/xmlapi/'.freeze

  def initialize(game_id)
    @game_id = game_id
  end

  def fetch_board_game_rating
    conn = Faraday.get("#{BASE_URL}boardgame/#{@game_id}?stats=1")

    if conn.status == 200
      doc = Nokogiri::XML(conn.body)
      game_average_rating = doc.at_xpath("//average").text.to_f

      game_average_rating ? game_average_rating.round(1) : nil
    else
      puts "Connection failed for game id: #{conn.status}"
      nil
    end
  end

  def fetch_board_game_search
    conn = Faraday.get("#{BASE_URL}search?search=#{game_name}")

    if conn.status == 200
      doc = Nokogiri::XML(conn.body)

      doc.xpath("//boardgame").each do |game|
        game_id = game.attr("objectid")
        name = game.xpath("name").text
        year = game.xpath("yearpublished").text
      end
    else
      puts "Connection failed for search: #{conn.status}"
      nil
    end
  end
end
