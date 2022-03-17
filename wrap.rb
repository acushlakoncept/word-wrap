class Wrapper
  def initialize(string, column)
    @string = string
    @column = column
    @start = 0
    @end = column - 1
  end

  def wrap
    return @string if @string.length <= @column
    wrap_words = ''
    
    while @start < @string.length
      substring = @string[@start..@end]
      @start = @end + 1
      @end += @column

      if @start < @string.length
        substring[-1] == ' ' ? substring.gsub(' ', '-') : substring << '-'
      end

      wrap_words << substring
    end
    wrap_words
  end

end

puts Wrapper.new('word word', 4).wrap()
