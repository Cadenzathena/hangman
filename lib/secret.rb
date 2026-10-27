# creates the secret word
class Secret
  attr_accessor :secret_word

  def initialize
    @candidates = []
  end

  def pick_secret_code
    generate_candidate_words
    @secret_word = @candidates.sample
  end

  private

  def generate_candidate_words
    File.readlines("lib/google-10000-english.txt").each do |line|
      @candidates.push(line.chomp.chars) if line.chomp.length.between?(5, 12)
    end
  end
end
