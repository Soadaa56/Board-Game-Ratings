Post.all.each do |post|
  bgg_id = post.bgg_id
  description = BggDataFetcher.fetch_board_game_details(bgg_id).first[:game_description]
  post.body = description
  post.save
end
