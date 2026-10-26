class GameVerdict
  def correct_letter?(secret_word:, input:)
    secret_word.include?(input) || false
  end

  def print_correct_feedback
    print "\033[1A\033[12C"
    puts " correct ".colorize(color: :black, background: :white)
  end

  def print_wrong_feedback
    print "\033[1A\033[12C"
    puts " wrong ".colorize(color: :black, background: :white)
  end
end
