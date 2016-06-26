class Crypto
  def initialize(string)
    @string = string
  end

  def normalize_plaintext
    @string.gsub(/\W/, '').downcase
  end

  def size
    size = normalize_plaintext.size
    Math.sqrt(size).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
    (0..size - 1).reduce('') do |a, index|
      a << plaintext_segments.map { |str| str[index] }.join
    end
  end

  def normalize_ciphertext
    (0...size).map do |i|
      plaintext_segments.map { |s| s[i] }.join
    end.join(' ')
  end
end
