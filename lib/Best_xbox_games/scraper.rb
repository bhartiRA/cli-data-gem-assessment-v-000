class Best_xbox_games::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.businessinsider.com/us-news-best-places-to-live-in-america-2016-3"))
  end

  def scrape_game_index
    self.get_page.css("div.slide-module")
  end

  def make_games
    scrape_game_index.each do |r|

    Best_xbox_games::Games.new_from_index_page(r)
    end

  end
end
