class Wrapper
  def initialize(string, column)
    @string = string
    @column = column
  end

  def wrap
    return "Expected String but got #{@string.class}" if @string.class != String
    return "Expected Integer but got #{@column.class}" if @column.class != Integer
    return 'Provide a column atleast greater than 0' if @column < 1

    return '' if @string == ''
    return ' ' if @string == ' '

    wrap_recursively(@string.reverse.scan(/\S+\s?/), @column).reverse
  end

  def wrap_recursively(array, column)
    first = array[0]

    if first.scan(/.{1,#{column}}/).length > 1
      first = first.strip.reverse.scan(/.{1,#{column}}/).collect(&:reverse).reverse.join("\n")
    end

    return first.strip if array.length == 1

    remainder = wrap_recursively(array[1..-1], column)

    line_length = remainder.index("\n") || remainder.length

    line_length + first.length > column ? first.strip + "\n" + remainder : first.strip + first[-1] + remainder
  end
end

puts Wrapper.new('word', 10).wrap  # word
puts Wrapper.new('word word', 5).wrap  # word\nword
puts Wrapper.new('word word word', 5).wrap  # word\nword\nword
puts Wrapper.new('word word word', 10).wrap  # word word\nword
puts Wrapper.new('wordword', 4).wrap  # word\nword
puts Wrapper.new('word word word', 3).wrap  # wor\nd\nwor\nd\nwor\nd