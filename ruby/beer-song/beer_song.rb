class String
  def pluralize(count)
    count == 1 ? self : self + 's'
  end
end

class BeerSong
  def verses(start_index, end_index)
    start_index.downto(end_index).reduce([]) { |a, e| a << verse(e) }.join("\n")
  end

  def verse(n)
    "#{n_or_no_bottles(n).capitalize} of beer on the wall, " \
      "#{n_or_no_bottles(n)} of beer.\n" \
      "#{take_one_down_or_store(n)}, "\
      "#{n_or_no_bottles(n - 1)} of beer on the wall.\n"
  end

  def lyrics
    verses(99, 0)
  end

  def take_one_down_or_store(n)
    if n == 0
      'Go to the store and buy some more'
    else
      "Take #{it_or_one(n)} down and pass it around"
    end
  end

  def it_or_one(n)
    n == 1 ? 'it' : 'one'
  end

  def n_or_no_bottles(n)
    n = 99 if n < 0
    n_or_no = n > 0 ? n.to_s : 'no more'
    n_or_no + ' ' + 'bottle'.pluralize(n)
  end
end

class BookKeeping
  VERSION = 2
end
