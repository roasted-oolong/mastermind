module CodeFeedback
    def self.call(guess, secret_code)
        exact_matches = 0
        color_matches = 0
        guess_leftover = []
        code_leftover = []

        def find_exact_matches
            guess.each_with_index do |color, index|
                if color == secret_code[index]
                    exact_matches += 1
                else
                    guess_leftover << color
                    code_leftover << secret_code[index]
                end
            end
        end

        def find_color_matches
            guess_leftover.each do |color|
                if code_leftover.include?(color)
                    color_matches += 1
                end
            end
        end

        puts "Red pegs: #{exact_matches}"
        puts "White pegs: #{color_matches}"
    end
end