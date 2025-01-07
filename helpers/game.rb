#General gameplay
#Start > Choose Maker or Guesser > Create code > Store code > Guess > Feedback on code > End Game

require_relative 'config/game_config'
require_relative 'function/generate_code'
require_relative 'function/player_input'
require_relative 'function/announce_results'

class Game
    def initialize
        @secret_code = GenerateCode.generate(GameConfig::VALID_COLORS, GameConfig::CODE_LENGTH)
        @guess_count = 0
        @max_guesses = GameConfig::MAX_GUESSES
    end

    def start
        #game flow
    end
end