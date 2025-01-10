require_relative 'generate_code'

module GuessCode
    def guess(guess, match_count, valid_colors) #number of exact matches + number of color matches
      case guess
      when match_count == 0
        #continue to the next color in "VALID_COLORS"
        #return four of that same color
      when match_count <= 3
        #continue to the next color in "VALID_COLORS"
        #return THREE of that same color in the last three places of the guess
      when match_count == 4
        #randomize elements of the array
      end
    end
end