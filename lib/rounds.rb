# prints game info to the console
module Rounds
  def self.print_round_start_info
    puts "\033[1A
      Find the secret word by inputting letters!
      A wrong letter will reduce your guesses!
      Input #{'"save"'.colorize(:blue)} to save your game
      "
  end

  def self.print_correct_feedback
    print "\033[1A\033[12C"
    puts " correct ".colorize(color: :black, background: :white)
    puts "\n"
  end

  def self.print_wrong_feedback
    print "\033[1A\033[12C"
    puts " wrong ".colorize(color: :black, background: :white)
    puts "\n"
  end
end
