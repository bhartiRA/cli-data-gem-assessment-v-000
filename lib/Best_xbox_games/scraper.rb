class Best_xbox_games::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.metacritic.com/feature/25-best-ios-games"))
  end

  def scrape_game_index
    self.get_page.css("table.listtable")
  end

  def make_games
    scrape_games_index.each do |r|
      2016_best_xbox_games::Games.new_from_index_page(r)
    end
  end
end
