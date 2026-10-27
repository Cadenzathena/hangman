# decreases guesses when necessary
class Guess
  attr_accessor :guesses

  def initialize
    @guesses = 8
  end

  def decrease_guesses
    @guesses -= 1
  end

  def print_guesses
    print "#{@guesses} Guesses left".colorize(:green)
  end

  def print_wrong_letters(wrongs:)
    print "       Wrong letters: #{wrongs}\n".colorize(:red)
  end
end
