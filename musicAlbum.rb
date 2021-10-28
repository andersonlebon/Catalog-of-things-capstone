require './item_copy'

class MusicAlbum < Item
    def initialize(name:, genre:, author:, source:, publish_date:, on_spotify:)
        super(name: name, genre: genre, author: author, source: source, publish_date: publish_date)
        @on_spotify = on_spotify
    end

    def can_be_archived?
        super() and @on_spotify
    end

    def get_h 
        date = "#{@publish_date.day}-#{@publish_date.month}-#{@publish_date.year}"
        { id: @id, name: @name, genre: @genre, author: @author, source: @source, published_date: date, on_spotify: @on_spotify, is_archived: can_be_archived?}
    end
end
