class Best_xbox_games::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.businessinsider.com/us-news-best-places-to-live-in-america-2016-3"))
  end

  def scrape_game_index
    self.get_page.css("div.slide-module")
  end

  def make_games
    scrape_game_index.each do |r|

    Best_xbox_games::Games.new(
      r.css("h3.slide-title").text,
      r.css("p:first").text.split(":")[1] ,
      r.css("p:nth-of-type(2)").text.split("$")[1] ,
      r.css("p:nth-of-type(3)").text.split(":")[1] ,
      r.css("p:nth-of-type(4)").text.split(":")[1],
      r.css("p span:nth-child(3)").text
        )
    end

  end
end
