class Best_xbox_games::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.rediffmail.com"))
  end

  def scrape_game_index
    self.get_page.css("div.newimgthumb a")
  end

  def make_games
    scrape_game_index.each do |r|
    Best_xbox_games::Games.new_from_index_page(r)
    end
    binding.pry
  end
end
