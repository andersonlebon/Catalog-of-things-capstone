# require 'genre'

class Creator
    def self.genre
        print "Enter Name: "
        name = gets.chomp
        Genre.new(name)
    end  

    def self.musicAl
        print "Enter published_date in the format y/m/d: "
        published_date = gets.chomp

        print "Is the Album on Spotify [Y/N]: "
        get_s = gets.chomp
        is_spotify = get_s == ("y" or "Y") ? true :  false 
        MusicAlbum.new(published_date, is_spotify) 
    end
end