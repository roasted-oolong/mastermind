#General gameplay
#Start > Choose Maker or Guesser > Create code > Store code > Guess > Feedback on code > End Game

require_relative 'config/game_config'
require_relative 'function/generate_code'
require_relative 'function/player_input'
require_relative 'function/code_feedback'
require_relative 'function/announce_results'

class Game
    def initialize
        @secret_code = nil
        @guess_count = 0
        @max_guesses = GameConfig::MAX_GUESSES
        @last_guess = nil
        @player_role = nil
    end

    def play
        puts "Let's start a game of Mastermind ✨"
        @player_role = PlayerInput.get_role

        case @player_role
        when 'breaker'
            puts "Breaker it is. I've though of a 4-color code. Guess the code!"
            @secret_code = GenerateCode.generate(GameConfig::VALID_COLORS, GameConfig::CODE_LENGTH)
            
            until game_over?
                puts "Enter your guess"
                guess = PlayerInput.get_code
                @last_guess = guess
                @guess_count += 1

                feedback = CodeFeedback.call(guess, @secret_code)
                AnnounceResults.display(@last_guess, @secret_code, @max_guesses, @guess_count)
            end
        when 'maker'
            puts "Maker it is. You create your code, and I'll guess!"
            @secret_code = PlayerInput.get_code

            puts "More to come! Building in real-time..."
        end
    end

    def game_over?
        @guess_count >= @max_guesses || @secret_code == @last_guess
    end
end