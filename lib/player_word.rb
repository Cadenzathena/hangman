class PlayerWord
  attr_reader :correct_submission, :wrong_submission

  def initialize
    @correct_submission = []
    @wrong_submission = []
  end

  def update_correct_submission(secret_word:, input:)
    if @correct_submission.empty?
      generate_indexes(secret_word, input)
    else
      @correct_submission.map!.with_index do |item, index|
        secret_word[index] == input ? input : item
      end
    end
  end

  private

  def generate_indexes(secret_word, input)
    secret_word.length.times do
      @correct_submission.push("")
    end
    update_correct_submission(secret_word: secret_word, input: input)
  end

  public

  def update_wrong_submission(input:)
    @wrong_submission.push(input)
  end
end
