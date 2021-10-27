require './item_copy'

class MusicAlbum < Item
    def initialize(publish_date, on_spotify)
        super(publish_date)
        @on_spotify = on_spotify
    end

    def can_be_archived?
        super() and @on_spotify
    end

    def get_h 
        date = "#{@publish_date.day}-#{@publish_date.month}-#{@publish_date.year}"
        {published_date: date, on_spotify: @on_spotify}
    end
end
