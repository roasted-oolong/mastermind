#General gameplay
#Start > Choose Maker or Guesser > Create code > Store code > Guess > Feedback on code > End Game

require_relative 'config/game_config'
require_relative 'function/generate_code'
require_relative 'function/player_input'
require_relative 'function/code_feedback'
require_relative 'function/announce_results'
require_relative 'function/guess_code'

class Game
    def initialize
        @secret_code = nil
        @guess_count = 0
        @max_guesses = GameConfig::MAX_GUESSES
        @last_guess = 'None'
        @player_role = nil
    end

    def play
        puts "Let's start a game of Mastermind ✨"
        @player_role = PlayerInput.choose_role

        case @player_role
        when 'breaker'
            puts "Breaker it is. I've though of a 4-color code. Guess the code!"
            @secret_code = GenerateCode.generate(GameConfig::VALID_COLORS, GameConfig::CODE_LENGTH)
            
            until game_over?
                puts "Enter your guess"
                @last_guess = PlayerInput.get_code
                @guess_count += 1

                CodeFeedback.call(@last_guess, @secret_code, @player_role)
                AnnounceResults.display(@last_guess, @secret_code, @max_guesses, @guess_count)
            end
        when 'maker'
            puts "Maker it is. You create your code, and I'll guess!"
            @secret_code = PlayerInput.get_code

            #First Guess
            @last_guess = GenerateCode.same_four(GameConfig::VALID_COLORS)
            @guess_count += 1
            
            until game_over?
                puts "#{@last_guess}"
                match_count = PlayerInput.feedback(@last_guess, @secret_code) #Human player gives computer feedback on its guess
                @last_guess = GuessCode.guess(@last_guess, match_count)
                @guess_count += 1

                AnnounceResults.display(@last_guess, @secret_code, @max_guesses, @guess_count)
            end

            puts "More to come! Building in real-time..."
        end
    end

    def game_over?
        @guess_count >= @max_guesses || @secret_code == @last_guess
    end
end