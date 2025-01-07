module GenerateCode
  def self.call(valid_colors, code_length)
    Array.new(code_length) { valid_colors.sample }
  end
end