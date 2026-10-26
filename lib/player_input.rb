class PlayerInput
  attr_reader :input

  def initialize
    @alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
  end

  def request_input
    @input = gets.chomp
    input_validation
  end

  private

  def input_validation
    if @input.upcase == "SAVE"
      puts "Time to save!"
    elsif @input.length != 1 ||
          @input.chars.any? { |character| !@alphabet.include?(character) }
      puts "Input a valid english letter or the word\nInput \"save\" if you want to save your game".colorize(:red)
      request_input
    else
      @input.downcase!
    end
  end
end
