require '../item'

class MusicAlbum < item
    def initialize(name:, genre:, author:, source:, label:, publish_date:, id:, on_spotify:)
        super(name, genre, author, source, label, publish_date, id)
        @on_spotify = false 
    end
end