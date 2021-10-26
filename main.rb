# frozen_string_literal: true

require 'fileutils'
require 'json'


def welcome
  puts "\n\n"
  puts decorate('WELCOME TO CATALOG APP')
  puts decorate('Please select one of the options bellow')
end

def decorate(message)
  puts '=' * (message.length + 4)
  puts "|#{' ' * (message.length + 2)}|"
  puts "| #{message} |"
  puts "|#{' ' * (message.length + 2)}|"
  puts '=' * (message.length + 4)
end

def options
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
    '12.=> Add a game'
  ]

  puts message
end

def main
  welcome
  options
end



def CreateFile (file_name)
    FileUtils.touch(file_name)
end


FileUtils.touch("caleb.json")
# puts File.open("caleb.json")
# main
File.write("caleb.json", JSON.dump({books: ["hello"], authors: ["autors2"]}))
puts JSON.parse(File.read("caleb.json")).class