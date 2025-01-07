module CodeFeedback
    def self.call(guess, secret_code)
        exact_matches = 0
        color_matches = 0

        guess.each_with_index do |color, index|
            if color == secret_code[index]
                exact_matches += 1
            else if secret_code.include?(color) && secret_code[index] != color
                color_matches += 1
            end
        end

        puts "Red pegs: #{exact_matches}"
        puts "White pegs: #{color_matches}"
    end
end