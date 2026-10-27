# loads saved state from yaml file
module Load
  def self.load_state
    if File.exist?("saves/hangman_save.yml")
      File.open("saves/hangman_save.yml") do |file|
        Load.print_good_load_info
        return YAML.unsafe_load(file)
      end
    else
      Load.print_bad_load_info
    end
  end

  def self.print_bad_load_info
    puts " 🛈 No save state found ".colorize(color: :black, background: :yellow)
    puts "\n"
  end

  def self.print_good_load_info
    puts " 🛈 Save loaded ".colorize(color: :black, background: :green)
    puts "\n"
  end
end
