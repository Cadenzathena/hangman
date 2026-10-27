# saves the state of the programs in a reloadable yaml file
module Save
  def self.save_state(state)
    if File.exist?("saves/hangman_save.yml")
      File.open("saves/hangman_save.yml", "w") do |file|
        serial_yaml = YAML.dump(state)
        file.puts serial_yaml
      end
    else
      File.new("saves/hangman_save.yml", "w")
      save_state(state)
    end
  end

  def self.print_save_info
    puts " 🛈 Your game has been saved ".colorize(color: :black, background: :yellow)
    puts "\n"
  end
end
