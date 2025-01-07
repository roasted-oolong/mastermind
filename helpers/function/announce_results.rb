module AnnounceResults
    def self.display(player_code, secret_code, max_guesses, guess_count)
        case
        when player_code == secret_code
            puts 'The correct code has been guessed. Codebreaker wins!'
        when guess_count >= max_guesses
            puts "No more turns left. The code was: #{secret_code.join(', ')}. Codemaker wins!"
        else
            puts "Incorrect guess. #{max_guesses - guess_count} guesses left."
        end
    end
end
