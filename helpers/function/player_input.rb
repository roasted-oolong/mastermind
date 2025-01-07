require_relative '../config/game_config'

module PlayerInput
    def self.get_code
        puts 'Enter code (example: green blue pink red)'
        puts "Colors: #{GameConfig::VALID_COLORS.join(', ')}"
        input = gets.chomp.downcase.split

        valid_input?(input) ? input : get
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
end