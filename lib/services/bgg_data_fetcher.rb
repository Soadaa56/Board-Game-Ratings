require 'faraday'
require 'nokogiri'

class BggDataFetcher
  BASE_URL = 'https://api.geekdo.com/xmlapi/boardgame/'.freeze

  def initialize(game_id)
    @game_id = game_id
  end

  def fetch_board_game_rating
    conn = Faraday.get("#{BASE_URL}#{@game_id}?stats=1")

    if conn.status == 200
      doc = Nokogiri::XML(conn.body)
      game_average_rating = doc.at_xpath("//average").text.to_f

      game_average_rating ? game_average_rating.round(1) : nil
    else
      puts "Connection failed: #{conn.status}"
      nil
    end
  end
end
