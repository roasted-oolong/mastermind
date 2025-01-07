require_relative './config/game_config'

module PlayerInput
    def self.get
        puts 'Enter code (example: green blue pink red)'
        puts "Colors: #{GameConfig::VALID_COLORS.join(', ')}"
        input = gets.chomp.downcase.split
    end
end