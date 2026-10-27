require "json"
require "colorize"
require "tty-prompt"
require_relative "lib/rounds"
require_relative "lib/tty_prompt_wrapper"
require_relative "lib/guess"
require_relative "lib/secret"
require_relative "lib/player_input"
require_relative "lib/game_verdict"
require_relative "lib/answer"
require_relative "lib/save"

prompt = TTYPromptWrapper.new
secret = Secret.new
guess = Guess.new
answer = Answer.new
player_input = PlayerInput.new
game_verdict = GameVerdict.new

puts "PLAY HANGMAN"
selected_mode = prompt.select_mode(
  question: "",
  choices: ["LOAD GAME", "NEW GAME"]
)

if selected_mode == "NEW GAME"
  secret.pick_secret_code
  Rounds.print_round_start_info
  answer.generate_indexes(secret_word: secret.secret_word)

  while guess.guesses.positive?
    answer.print_answer
    guess.print_guesses
    guess.print_wrong_letters(wrongs: answer.wrong_answer)
    player_input.request_input

    if player_input.input == "save"
      Save.save_attr([secret, guess, answer, player_input, game_verdict])
      puts " 🛈 Your game has been saved ".colorize(color: :black, background: :yellow)
      puts "\n"
      redo
    end

    if game_verdict.correct_letter?(secret_word: secret.secret_word, input: player_input.input)
      Rounds.print_correct_feedback
      answer.update_answer(secret_word: secret.secret_word, input: player_input.input)
      next unless game_verdict.win?(secret_word: secret.secret_word, player_answer: answer.answer)

      puts "You found the secret word #{secret.secret_word.join.colorize(:yellow)}! You win!"
      return
    else
      Rounds.print_wrong_feedback
      answer.update_wrong_answer(input: player_input.input)
      guess.decrease_guesses
    end
  end
  puts "You ran out of guesses! The secret word was #{secret.secret_word.join.colorize(:yellow)}"

elsif selected_mode == "LOAD GAME"
  puts "Not ready yet!"
end
