require_relative 'genre'
require_relative 'musicAlbum'
require_relative 'creator'

class App
    def initialize
        @genres = []
        @labels = []
        @authors = []
        @sources = []
        @books = []
        @musicAlbum = []
        @movies = []
        @games = []
    end

    def  add_genre
        genre = Creator.genre
        @genres<< genre
        save_file("genres", genre.get_h) 

    end

    def  add_source(source)
        @sources<< source        
    end

    def  add_book(book)
        @books<< book       
    end

    def  add_music
        new_album = Creator.musicAl
        @musicAlbum << new_album
        save_file("musicAlbum", [new_album.get_h]) 
    end

    def  add_author(author)
        @authors<< author        
    end
end