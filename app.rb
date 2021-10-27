require_relative 'genre'
require_relative 'musicAlbum'
require_relative 'creator'
require_relative 'author'

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
        new_genre = Creator.genre
        @genres<< new_genre
        save_file("genres", new_genre.get_h) 

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
        save_file("musicAlbum", new_album.get_h)
        new_genre = Creator.automatic_genre(new_album.genre)
        @genres<< new_genre
        save_file("genres", new_genre.get_h) 
    end

    def  add_author(author)
        @authors<< author        
    end
end