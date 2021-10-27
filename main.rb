# frozen_string_literal: true

require_relative 'rb files/handler'
require_relative 'rb files/console'

def decorate(message)
  puts '=' * (message.length + 4)
  puts "|#{' ' * (message.length + 2)}|"
  puts "| #{message} |"
  puts "|#{' ' * (message.length + 2)}|"
  puts '=' * (message.length + 4)
end

def options(string, handler)
  Console.clean
  puts(string)
  message = [
    '1.  => List all books',
    '2.  => List all music albums',
    '3.  => List of games',
    '4.  => List all genres',
    '5.  => List all labels',
    '6.  => List all authors ',
    '7.  => Add a book',
    '8.  => Add a music album',
    '9.  => Add a game',
    '10. => Add a author',
    '11. => Add a genre',
    '12. => Add a label',
    '13. => Exit'
  ]

  puts('')
  puts message
  puts('')
  entry = gets.chomp
  handler.do(entry)
end

def main
  string = 'WELCOME TO CATALOG APP'
  handler = Handler.new
  handler.load_all
  string = options(string, handler) while string != 'bye'
end

main
