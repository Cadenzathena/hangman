class GameRound
  def initialize
    @player_guesses = 8
  end

  def print_player_guesses_left
    print "#{@player_guesses} Guesses left".colorize(:green)
  end

  def remove_player_guess
    @player_guesses -= 1
  end

  def print_round_start_info
    puts "\nInput a single letter to find the secret word!\nA wrong letter will reduce your guesses!"
    puts "Input #{'"save"'.colorize(:blue)} to save your game"
  end
end
