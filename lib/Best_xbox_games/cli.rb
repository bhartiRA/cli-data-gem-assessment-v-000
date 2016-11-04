class Best_xbox_games::CLI

  def call
    Best_xbox_games::Scraper.new.make_games
    puts "Welcome to the xbox 20 Best games of 2016"
    start
  end

  def start
    puts ""
    puts "What number games would you like to see? 1-10, 11-20"
    input = gets.strip.to_i
    show_games(input)

    puts ""
    puts "What game would you like more information on?"
    input = gets.strip

    game = Best_xbox_games::Games.find(input.to_i)

    show_game(game)

    puts ""
    puts "Would you like to see another game? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "Thankyou! Have a great day!"
      exit
    end
  end

  def show_game(game)
    puts ""
    puts "----------- #{game.rank} - #{game.name} -----------"
    puts ""
    puts "Description:           #{game.description}"
  end

  def show_games(from_number)
    puts ""
    puts "---------- Games #{from_number} - #{from_number+9} ----------"
    puts ""
    Best_xbox_games::Games.all[from_number-1, 10].each.with_index(from_number) do |game, index|
      puts "#{index}. #{game.rank} - #{game.name}"
    end
  end

end
