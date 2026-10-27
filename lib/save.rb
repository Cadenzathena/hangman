module Save
  def self.save_attr(arr)
    if File.exist?("saves/hangman_save.txt")
      File.open("saves/hangman_save.txt", "w") do |file|
        json_arr = JSON.dump(arr)
        file.puts json_arr
      end
    else
      File.new("saves/hangman_save.txt", "w")
      save_attr(arr)
    end
  end
end
