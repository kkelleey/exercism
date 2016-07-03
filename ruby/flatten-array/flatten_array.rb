class FlattenArray
  VERSION = 1

  def self.flatten(array)
    array.each_with_object([]) do |element, result|
      next if element.nil?
      if element.is_a? Array
        sub_array = flatten(element)
        result.concat(sub_array)
      else
        result << element
      end
    end
  end
end
