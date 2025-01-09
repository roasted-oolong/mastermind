require_relative '../config/game_config'

module GuessCode
    def guess(guess, match_count_arr) #[number of exact matches, number of color matches]
      case guess
      when #exact matches + color matches == 0
        #continue to the next color in "VALID_COLORS"
        #return four of that same color
      when #exact matches + color matches <=3 
        #continue to the next color in "VALID_COLORS"
        #return THREE of that same color in the last three places of the guess
      when #exact matches + color matches == 4
        #randomize elements of the array
      end
    end
end