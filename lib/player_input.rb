# requests and validates player input
class PlayerInput
  attr_reader :input

  def initialize
    @alphabet = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
  end

  def request_input
    print "Input: "
    @input = gets.chomp
    input_validation
  end

  private

  def input_validation
    if @input.downcase == "save"
      @input = "save"
    elsif @input.length != 1 ||
          @input.chars.any? { |character| !@alphabet.include?(character) }
      puts "\nInput a valid english letter\nInput \"save\" if you want to save your game".colorize(:red)
      request_input
    else
      @input.downcase!
    end
  end
end
