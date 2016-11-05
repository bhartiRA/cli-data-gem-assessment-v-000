class Best_xbox_games::CLI

  def call
    Best_xbox_games::Scraper.new.make_games
    start
  end

  def start
    print  %x{clear}
    puts "Welcome to the 50 Best cities to live in America 2016"
    puts ""
    puts "What number city would you like to see?"
    puts "a) 1-10"
    puts "b) 11-20 "
    puts "c) 21-30"
    puts "d) 31-40 "
    puts "e) 41-50"
    puts "Enter the alphabet"
    input= ' '
    while !['a','b','c','d','e'].include?(input) do
     input = gets.strip
    end
    i=1
    case input
    when 'a'
      i=1
    when 'b'
      i=11
    when 'c'
      i=21
    when 'd'
      i=31
    when 'e'
      i=41
    end
    print  %x{clear}
    show_cities(i)

    puts ""
    puts "Which city would you like more information about? Enter the number"

    input1 = gets.strip

    game = Best_xbox_games::Games.find(input1.to_i)

    show_city(game)

    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "Would you like to continue? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "Thank you! Have a great day! Bye !"
      exit
    end
  end

  def show_city(game)
    print  %x{clear}
    120.times do print "*" end
    puts "                      #{game.rank_city.upcase} "
    120.times do print "*" end
    puts ""
    puts "Population           #{game.population}"
    puts "median_annual_salary #{game.median_annual_salary}"
    puts "quality_of_life      #{game.quality_of_life}"
    puts "overall_value        #{game.overall_value}"
    puts ""
    puts "#{game.description}"
    120.times do print "*" end
    ##puts "Description:           #{game.description}"
  end

  def show_cities(from_number)
    120.times do print "*" end
    puts ""
    puts "             Cities #{from_number} - #{from_number+9} "
    120.times do print "*" end
    puts ""
    puts "No.           rank city"
    Best_xbox_games::Games.all[from_number-1, 10].each.with_index(from_number) do |game, index|
    puts "#{index}.        #{game.rank_city.split(".")[1]}"
    end
    120.times do print "*" end
  end


end
