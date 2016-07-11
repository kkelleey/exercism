class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    self.next.nil?
  end
end

class SimpleLinkedList
  def initialize(data = [])
    @elements = []
    push_array(data.reverse) if data
  end

  def self.from_a(array)
    new(array)
  end

  def to_a
    @elements.map(&:datum).reverse
  end

  def reverse
    data = to_a
    @elements.clear
    push_array(data)
    self
  end

  def size
    @elements.size
  end

  def empty?
    @elements.empty?
  end

  def push(value)
    @elements << Element.new(value, head)
  end

  def peek
    head&.datum
  end

  def head
    @elements.last
  end

  def pop
    @elements.pop.datum
  end

  private

  def push_array(values)
    values.each { |value| push(value) }
  end

end
