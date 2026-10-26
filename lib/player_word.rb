class PlayerWord
  attr_reader :submission

  def initialize
    @submission = []
  end

  def update_submission(secret_word:, letter:)
    if @submission.empty?
      generate_indexes(secret_word, letter)
    else
      @submission.map!.with_index do |item, index|
        secret_word[index] == letter ? letter : item
      end
    end
  end

  private

  def generate_indexes(secret_word, letter)
    secret_word.length.times do
      @submission.push("")
    end
    update_submission(secret_word: secret_word, letter: letter)
  end
end
