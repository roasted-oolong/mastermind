require_relative './config/game_config'

module PlayerInput
    def self.get
        puts 'Enter code (example: green blue pink red)'
        puts "Colors: #{GameConfig::VALID_COLORS.join(', ')}"
        input = gets.chomp.downcase.split

        valid_move?(input)
    end

    def self.valid_move?(input)
        invalid_colors = input.reject { |color| GameConfig::VALID_COLORS.include?(color) }

        case invalid_input
        when input.length != GameConfig::CODE_LENGTH
            puts "Error: Please enter #{GameConfig::CODE_LENGTH} colors to continue."
        when invalid_colors.any?
            puts "Error: Invalid colors. Please input a code from these colors: #{GameConfig::VALID_COLORS.join(', ')}."
        else 
            puts 'Processing...'
        end
    end
end