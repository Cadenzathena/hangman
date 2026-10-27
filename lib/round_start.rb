# prints starting game info to the console
module RoundStart
  def self.print_round_start_info
    puts "\033[1A
      Find the secret word by inputting letters!
      A wrong letter will reduce your guesses!
      Input #{'"save"'.colorize(:blue)} to save your game
      "
  end
end
