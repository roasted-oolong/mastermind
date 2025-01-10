require_relative 'generate_code'

module GuessCode
    def self.guess(guess, match_count, valid_colors) #number of exact matches + number of color matches
      case match_count
      when 0
        new_guess = guess.map { valid_colors[1] }
        return new_guess

      when 1..3
        new_color_index = valid_colors.find_index(guess[match_count]) + 1
        new_color = valid_colors[new_color_index]
        new_guess = guess[0..match_count - 1] + Array.new(guess.length - match_count, new_color)
        return new_guess

      when 4
        new_guess = guess.shuffle
        return new_guess
      end
    end
end