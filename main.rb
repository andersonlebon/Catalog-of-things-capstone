# frozen_string_literal: true

require 'fileutils'
require 'json'
require './app'
require "./file_manager"


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
    createFiles(["genres", "musicAlbum"])
    welcome
    options
    store = App.new
    loop do
        case gets.chomp
        when "2"
            musicAlbums = read_file("musicAlbum")
            musicAlbums.each {|album| puts "Published_date: #{album["published_date"]}" }
        when "5"
          genres = read_file("genres")
          genres.each {|genre| puts "[ #{genre["name"].upcase} ]"}
        when "10"
            store.add_music             
            store.add_genre
        else
            return
        end
    end
    
  
end





# FileUtils.touch("caleb.json")
# puts File.open("caleb.json")
main
# File.write("caleb.json", JSON.dump({books: ["hello"], authors: ["autors2"]}))
# puts JSON.parse(File.read("caleb.json")).class

# class Try
#   def initialize(name:)
#     @name = name
#     @date = 2020
#   end
# end

# class Ican < Try
#   attr_accessor :name, :date
#   def initialize(name:)
#     super(name:name,)
    
#   end
#   def doyou
#     "hello"
#   end

#   def say
#     doyou+ "caleb"
#   end
# end

# def get_input(mesage)
#         print "    #{message}"
#         gets
# end

# m = get_input("enter name")

# puts ok

# puts message