class Acronym
  def self.abbreviate(string)
    string.gsub(/([[:lower:]])([[:upper:]])/, '\\1 \\2')
          .split(/[\s\-]/).map { |word| word[0] }.join.upcase
  end
end
