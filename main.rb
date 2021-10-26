# frozen_string_literal: true

require_relative 'rb files/handler'

def decorate(message)
  puts '=' * (message.length + 4)
  puts "|#{' ' * (message.length + 2)}|"
  puts "| #{message} |"
  puts "|#{' ' * (message.length + 2)}|"
  puts '=' * (message.length + 4)
end

def options(string, _handler)
  puts(string)
  puts('')
  message = [
    '1.=> List all books',
    '2.=> List all music albums',
    '3.=> List all movies',
    '4.=> List of games',
    '5.=> List all genres',
    '6.=> List all labels',
    '7.=> List all authors ',
    '8.=> List all sources',
    '9.=> Add a book',
    '10.=> Add a music album',
    '11.=> Add a movie',
    '12.=> Add a game',
    '13.=> Add a author',
    '14.=> Exit'
  ]

  puts('')
  puts message
  puts('')
  entry = gets.chomp
  return Handler.do(entry)
end

def main
  string = 'WELCOME TO CATALOG APP'
  handler = Handler.new
  string = options(string, handler) while string != 'bye'
end

main
