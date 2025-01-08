module GenerateCode
  def self.generate(valid_colors, code_length)
    Array.new(code_length) { valid_colors.sample }
  end

  def self.same_four(array_index)
    Array.new(4, array_index[0])
  end
end