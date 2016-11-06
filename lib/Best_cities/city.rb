class BestCity::City

  attr_accessor :population, :median_annual_salary,:quality_of_life ,:overall_value,:rank_city, :description

  @@all = []

  def initialize(rank_city=nil, population=nil, median_annual_salary=nil, quality_of_life=nil, overall_value=nil,description=nil)
    @description = description
    @rank_city = rank_city
    @population=population
    @median_annual_salary=median_annual_salary
    @quality_of_life=quality_of_life
    @overall_value=overall_value
    @@all.unshift(self)

  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  end
