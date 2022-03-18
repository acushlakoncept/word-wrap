# Word Wrap

The class has a static function named wrap that takes two arguments, a string, and a column number. The function returns the string, but with line breaks inserted at just the right places to make sure that no line is longer than the column number. 

Like a word processor, the lines are broken by replacing the last space in a line with a newline.

### Sample Test

```ruby
puts Wrapper.wrap('word', 10)  # => word
puts Wrapper.wrap('word word', 5) # => word\nword
puts Wrapper.wrap('word word word', 5) # => word\nword\nword
puts Wrapper.wrap('word word word', 10) # => word word\nword
puts Wrapper.wrap('wordword', 4) # => word\nword
puts Wrapper.wrap('word word word', 3)  # => wor\nd\nwor\nd\nwor\nd
```

## Testing

To test the code, run `rspec` from root of the folder using terminal.

> Rspec is used for the test, to install the gem file, run

~~~bash
$ bundle install 
~~~

# Author

👤 **Uduak Essien**

- Github: [@acushlakoncept](https://github.com/acushlakoncept/)
- Twitter: [@acushlakoncept](https://twitter.com/acushlakoncept)
- Linkedin: [acushlakoncept](https://www.linkedin.com/in/acushlakoncept/)