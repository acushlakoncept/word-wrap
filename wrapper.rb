class Wrapper
  def initialize(string, column)
    @string = string
    @column = column
  end

  def wrap
    wrap_recursively(@string.reverse.scan(/\S+\s?/), @column).reverse
  end

  def wrap_recursively(array, column)
    first = array[0]

    if first.scan(/.{1,#{column}}/).length > 1
      first = first.strip.reverse.scan(/.{1,#{column}}/).collect(&:reverse).reverse.join('-')
    end

    return first.strip if array.length == 1

    remainder = wrap_recursively(array[1..-1], column)

    line_length = remainder.index('-') || remainder.length

    line_length + first.length > column ? "#{first.strip}-#{remainder}" : first.strip + first[-1] + remainder
  end
end


puts Wrapper.new('word word word manage', 6).wrap
