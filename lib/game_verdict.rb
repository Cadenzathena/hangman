# Determines if the game has been won
class GameVerdict
  def correct_letter?(secret_word:, input:)
    secret_word.include?(input) || false
  end

  def win?(secret_word:, player_answer:)
    secret_word == player_answer
  end
end
