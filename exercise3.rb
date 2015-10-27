puts "What is your name?"
name = gets.chomp.capitalize!

puts "Hi, #{name}!"

puts "How old are you?"
age = gets.chomp.to_i
birthyear = 2015 - age
puts "You were probably born in #{birthyear.to_s}!"