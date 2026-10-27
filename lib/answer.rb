# updates the players valid answers/submissions
class Answer
  attr_accessor :answer, :wrong_answer

  def initialize
    @answer = []
    @wrong_answer = []
  end

  def generate_indexes(secret_word:)
    secret_word.length.times do
      @answer.push("_")
    end
  end

  def update_answer(secret_word:, input:)
    @answer.map!.with_index do |item, index|
      secret_word[index] == input ? input : item
    end
  end

  def update_wrong_answer(input:)
    @wrong_answer.push(input)
  end

  def print_answer
    puts @answer.join(" ")
  end
end
