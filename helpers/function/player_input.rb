module PlayerInput
    puts 'Enter code (example: green blue pink red)'
    puts 'Colors: red, green, blue, yellow, orange, pink'
    input = gets.chomp.map(&:downcase)
end