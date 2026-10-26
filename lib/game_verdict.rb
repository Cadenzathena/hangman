class GameVerdict
  def correct_letter?(secret_word:, letter:)
    secret_word.include?(letter) || false
  end
end
