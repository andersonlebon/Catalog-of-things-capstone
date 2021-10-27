
def get_input(message)
        print "    #{message}"
        gets.chomp
    end

class Creator
    

    def self.genre
        name = get_input("Enter Name of genres: ")
        Genre.new(name)
    end

    def self.automatic_genre(name)
        Genre.new(name)
    end

    def self.author
        first_name = get_input("Enter the first name of the author")
        last_name = get_input("Enter the last name of the author")
        Author.new(first_name, last_name)
    end

    def self.musicAl
        name = get_input("Enter the name of the music album: ")
        genre = get_input("Enter the genre of the music album: ")
        source = get_input("Enter the source of the music album: ")
        author = get_input("Enter the authot of the music album: ")
        published_date = get_input("Enter published_date in the format y/m/d: ")
        get_s = get_input("Is this Album on Spotify [Y/N]?: ")
        is_spotify = get_s == ("y" or "Y") ? true :  false 
        MusicAlbum.new(name: name, genre: genre, author: author, source: source, publish_date: published_date, on_spotify: is_spotify) 
    end
end