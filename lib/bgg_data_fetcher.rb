require 'faraday'
require 'nokogiri'

class BggDataFetcher
  BASE_URL = 'https://api.geekdo.com/xmlapi/'.freeze

  def fetch_board_game_rating(game_id)
    doc = faraday_conn("#{BASE_URL}boardgame/#{game_id}?stats=1")
    game_average_rating = doc.at_xpath("//average").text.to_f

    game_average_rating ? game_average_rating.round(1) : nil
  end

  def fetch_board_game_search(game_name)
    doc = faraday_conn("#{BASE_URL}search?search=#{game_name}")
    results = []

    doc.xpath("//boardgame").each do |game|
      game_id = game.attr("objectid")
      name = game.xpath("name").text
      year = game.xpath("yearpublished").text

      results << { game_id: game_id, name:name, year: year }
    end

    results
  end

  def self.fetch_board_game_details(game_id)
    conn = Faraday.get("#{BASE_URL}boardgame/#{game_id}?stats=1")
    results = []

    if conn.status == 200
      doc = Nokogiri::XML(conn.body)

      doc.xpath("//boardgame").each do |game|
        game_image_url = game.xpath("image").text
        game_thumbnail_url = game.xpath("thumbnail").text
        game_description = game.xpath("description").text.gsub(/<br\s*\/?>/, ' ')

        results << { game_image_url: game_image_url,
        game_thumbnail_url: game_thumbnail_url,
        game_description: game_description }
      end
      results
    else
      puts "Connection failed for details: #{conn.status}"
      nil
    end
  end

  # Unsure why this refactored method fails
  # def self.fetch_board_game_details(game_id)
  #   doc = faraday_conn("#{BASE_URL}boardgame/#{game_id}?stats=1")
  #   results = []
  #   doc.xpath("//boardgame").each do |game|
  #     game_image_url = game.xpath("image").text
  #     game_thumbnail_url = game.xpath("thumbnail").text
  #     game_description = game.xpath("description").text.gsub(/<br\s*\/?>/, ' ')

  #     results << { game_image_url: game_image_url, game_thumbnail_url: game_thumbnail_url, game_description: game_description }
  #   end
  #   results
  # end

  # Currently not in use
  def fetch_board_game_image(game_id)
    doc = faraday_conn("#{BASE_URL}boardgame/#{game_id}?stats=1")
    game_image = doc.xpath("//image")

    game_image ? game_image.text : nil
  end


  private

  def faraday_conn(url)
    conn = Faraday.get(url)

    if conn.status == 200
      Nokogiri::XML(conn.body)
    else
      Rails.logger.error "Faraday connection failed: #{conn.status}"
      nil
    end
  end
end
