class BestCity::Scraper

  def get_page
    Nokogiri::HTML(open("http://www.businessinsider.com/us-news-best-places-to-live-in-america-2016-3"))
  end

  def scrape_game_index
    self.get_page.css("div.slide-module")
  end

  def make_games
    scrape_game_index.each do |c|
    city=  c.css("h3.slide-title").text
    pop=  c.css("p:first").text.split(":")[1]
    sal=  c.css("p:nth-of-type(2)").text.split("$")[1]
    qual=  c.css("p:nth-of-type(3)").text.split(":")[1]
    value=  c.css("p:nth-of-type(4)").text.split(":")[1]
    desc=  c.css("p:nth-of-type(5)").text
    BestCity::City.new(
      city,pop,sal,qual,value,desc
        )
    end

  end
end
