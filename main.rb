require "colorize"
require "tty-prompt"
require_relative "lib/tty_prompt_wrapper"
require_relative "lib/game_round"
require_relative "lib/secret"

prompt = TTYPromptWrapper.new
secret = Secret.new
game_round = GameRound.new

puts "PLAY HANGMAN"
selected_mode = prompt.select_mode(
  question: "",
  choices: ["LOAD GAME", "NEW GAME"]
)

if selected_mode == "NEW GAME"
  game_round.print_round_start_info
  game_round.print_player_guesses_left
  secret.pick_secret_code
else
  puts "Not ready yet!"
end
