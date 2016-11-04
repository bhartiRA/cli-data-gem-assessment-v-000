class Best_xbox_games::Games

  attr_accessor :other, :rankCity, :description

  @@all = []

  def self.new_from_index_page(r)
    self.new(
      r.css("h3.slide-title").text,
      r.css("p:first").text + " " + r.css("p:nth-of-type(2)").text  + " " + r.css("p:nth-of-type(3)").text +  " "+ r.css("p:nth-of-type(4)").text, 
      ##+ " " + r.css("p:third").text + " " + r.css("p:fourth").text ,
      r.css("p span:nth-child(3)").text
        )

  end

  def initialize(rankCity=nil, other=nil, description=nil)
    @description = description
    @other = other
    @rankCity = rankCity
    @@all << self

  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
