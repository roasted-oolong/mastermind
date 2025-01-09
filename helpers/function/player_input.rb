require_relative '../config/game_config'

module PlayerInput
    def self.get_code
        puts "Colors: #{GameConfig::VALID_COLORS.join(', ')}"
        input = gets.chomp.downcase.split

        valid_input?(input) ? input : get_code
    end

    def self.valid_input?(input)
        if input.length != GameConfig::CODE_LENGTH
            puts "Error: Please enter #{GameConfig::CODE_LENGTH} colors to continue."
            return false
        end

        invalid_colors = input.reject { |color| GameConfig::VALID_COLORS.include?(color) }
        if invalid_colors.any?
            puts "Error: Invalid colors. Please input a code from these colors: #{GameConfig::VALID_COLORS.join(', ')}."
            return false
        end

        puts 'Processing...'
        return true
    end

    def self.choose_role
        puts "Would you like to be the code breaker or maker?"
        puts "Type 'breaker' or 'maker'"
        player_role = gets.chomp.downcase
    end

    def self.feedback(guess, secret_code)
      exact_matches = 0
      color_matches = 0

      puts "__ Computer's guess: #{guess.join(' ')} __"
      puts "__ Your secret code: #{secret_code.join(' ')} __"
    
      puts "How many colors are exactly correct?"
      exact_matches = gets.chomp.to_i

      puts "How many colors are correct but not in the right position?"
      color_matches = gets.chomp.to_i

      return [`#{exact_matches}, #{color_matches}`]
    end
end