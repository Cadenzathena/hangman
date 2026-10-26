require "colorize"
require "tty-prompt"
require_relative "lib/tty_prompt_wrapper"
require_relative "lib/game_round"
require_relative "lib/secret"
require_relative "lib/player_input"
require_relative "lib/game_verdict"
require_relative "lib/player_word"

prompt = TTYPromptWrapper.new
secret = Secret.new
game_round = GameRound.new
player_input = PlayerInput.new
game_verdict = GameVerdict.new
player_word = PlayerWord.new

puts "PLAY HANGMAN"
selected_mode = prompt.select_mode(
  question: "",
  choices: ["LOAD GAME", "NEW GAME"]
)

if selected_mode == "NEW GAME"
  secret.pick_secret_code
  while game_round.player_guesses.positive?
    game_round.print_round_start_info
    game_round.print_player_guesses_left
    player_input.request_input

    if game_verdict.correct_letter?(secret_word: secret.secret_word, letter: player_input.input)
      player_word.update_submission(secret_word: secret.secret_word, letter: player_input.input)
      p player_word.submission
    else
      game_round.remove_player_guess
      next
    end
  end

elsif selected_mode == "LOAD GAME"
  puts "Not ready yet!"
end
