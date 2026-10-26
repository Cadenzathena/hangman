class Secret
  def initialize
    @candidates = []
  end

  def pick_secret_code
    generate_candidate_words
    @secret_word = @candidates.sample
    p @secret_word
  end

  private

  def generate_candidate_words
    File.readlines("lib/google-10000-english.txt").each do |line|
      @candidates.push([line.chomp]) if line.chomp.length.between?(5, 12)
    end
  end
end
