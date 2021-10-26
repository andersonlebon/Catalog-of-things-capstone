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


    def  self.add_genre(genre)
        @genres<< genre        
    end

    def  self.add_source(source)
        @sources<< source        
    end

    def  self.add_book(book)
        @books<< book        
    end

    def  self.add_movie(movie)
        @movies<< movie        
    end

    def  self.add_author(author)
        @authors<< author        
    end
end