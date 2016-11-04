class Best_xbox_games::Games

  attr_accessor :name, :rank, :description, :url

  @@all = []

  def self.new_from_index_page(r)
    self.new(
      r.css("td.rank a")..attribute("href").text,
      r.css("td.title a").attribute("href"),
      r.css("td.title").text,
        )
  end

  def initialize(rank=nil, url=nil, name=nil)
    @name = name
    @url = url
    @rank = rank
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def description
    @description ||= doc.xpath("//div[@class='blurb blurb_collapsed']").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
