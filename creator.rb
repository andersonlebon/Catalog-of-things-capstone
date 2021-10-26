require 'genre'

class Creator
    def self.create_genre(genre)
        print "Enter Name: "
        name = gets.chomp
        Genre.new(name)
    end  
end