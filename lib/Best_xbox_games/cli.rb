class Best_xbox_games::CLI

  def call
    Best_xbox_games::Scraper.new.make_games
    puts "Welcome to the 50 Best cities to live in America 2016"
    start
  end

  def start
    puts ""
    puts "What number city would you like to see? 1-10, 11-20, 21-30,31-40,41-50"
    input=0
    while ![1,11,21,31,41].include?(input) do
     input = gets.strip.to_i
    end
    show_cities(input)

    puts ""
    puts "What city would you like more information on?"

    input1 = gets.strip

    game = Best_xbox_games::Games.find(input1.to_i)

    show_city(game)

    puts ""
    puts "Would you like to see another city? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "Thankyou! Have a great day!"
      exit
    end
  end

  def show_city(game)
    puts ""
    puts "----------- #{game.rankCity} -----------"
    puts "Other:           #{game.other}"
    puts "#{game.description}"
    puts "------------------------------------"
    ##puts "Description:           #{game.description}"
  end

  def show_cities(from_number)
    puts ""
    puts "---------- Games #{from_number} - #{from_number+9} ----------"
    puts " No.                rank city"
    Best_xbox_games::Games.all[from_number-1, 10].each.with_index(from_number) do |game, index|
    puts "#{index}.        #{game.rankCity}"
    end
  end


end
