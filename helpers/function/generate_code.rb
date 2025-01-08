module GenerateCode
  def self.generate(valid_colors, code_length)
    Array.new(code_length) { valid_colors.sample }
  end

  def self.same_four(array) #generates four of the first value in a given array
    Array.new(4, array[0])
  end
end