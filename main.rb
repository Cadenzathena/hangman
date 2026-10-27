require "yaml"
require "colorize"
require "tty-prompt"
require_relative "lib/rounds"
require_relative "lib/tty_prompt_wrapper"
require_relative "lib/guess"
require_relative "lib/secret"
require_relative "lib/player_input"
require_relative "lib/game_verdict"
require_relative "lib/answer"
require_relative "lib/modules/save"
require_relative "lib/modules/load"

prompt = TTYPromptWrapper.new
secret = Secret.new
guess = Guess.new
answer = Answer.new
player_input = PlayerInput.new
game_verdict = GameVerdict.new
puts "PLAY HANGMAN"
selected_mode = prompt.select_mode(question: "", choices: ["LOAD GAME", "NEW GAME"])

def secret_found?(secret, guess, answer, player_input, game_verdict)
  if game_verdict.correct_letter?(secret_word: secret.secret_word, input: player_input.input)
    Rounds.print_correct_feedback
    answer.update_answer(secret_word: secret.secret_word, input: player_input.input)
    return true if game_verdict.win?(secret_word: secret.secret_word, player_answer: answer.answer)
  else
    Rounds.print_wrong_feedback
    answer.update_wrong_answer(input: player_input.input)
    guess.decrease_guesses
  end
  false
end

def start_game(secret, guess, answer, player_input, game_verdict) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
  while guess.guesses.positive?
    answer.print_answer
    guess.print_guesses
    guess.print_wrong_letters(wrongs: answer.wrong_answer)
    player_input.request_input

    if player_input.input == "save"
      Save.save_state({ secret: secret, guess: guess, answer: answer,
                        player_input: player_input, game_verdict: game_verdict })
      Save.print_save_info
      redo
    end
    next unless secret_found?(secret, guess, answer, player_input, game_verdict)

    puts "You found the secret word #{secret.secret_word.join.colorize(:yellow)}! You win!"
    return
  end
  puts "You ran out of guesses! The secret word was #{secret.secret_word.join.colorize(:yellow)}"
end

if selected_mode == "NEW GAME"
  secret.pick_secret_code
  Rounds.print_round_start_info
  answer.generate_indexes(secret_word: secret.secret_word)
  start_game(secret, guess, answer, player_input, game_verdict)
elsif selected_mode == "LOAD GAME"
  save_data = Load.load_state
  return if save_data.nil?

  start_game(*save_data.values_at(:secret, :guess, :answer, :player_input, :game_verdict))
end
