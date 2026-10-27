# saves the state of the programs in a reloadable json file
module Save
  def self.save_state(hash)
    if File.exist?("saves/hangman_save.json")
      File.open("saves/hangman_save.json", "w") do |file|
        serial_json = JSON.dump(hash)
        file.puts serial_json
      end
    else
      File.new("saves/hangman_save.json", "w")
      save_attr(hash)
    end
  end

  def self.print_save_info
    puts " 🛈 Your game has been saved ".colorize(color: :black, background: :yellow)
    puts "\n"
  end
end
