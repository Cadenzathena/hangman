require "colorize"
require "tty-prompt"
require_relative "lib/rounds"
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
  Rounds.print_round_start_info
  player_word.generate_indexes(secret_word: secret.secret_word)

  while game_round.guesses.positive?
    player_word.print_correct_submission
    game_round.print_guesses_left
    game_round.print_wrong_letters(wrongs: player_word.wrong_submission)
    player_input.request_input

    if game_verdict.correct_letter?(secret_word: secret.secret_word, input: player_input.input)
      Rounds.print_correct_feedback
      player_word.update_correct_submission(secret_word: secret.secret_word, input: player_input.input)
    else
      Rounds.print_wrong_feedback
      player_word.update_wrong_submission(input: player_input.input)
      game_round.decrease_guesses
    end
  end

elsif selected_mode == "LOAD GAME"
  puts "Not ready yet!"
end
