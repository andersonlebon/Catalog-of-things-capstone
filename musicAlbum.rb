require './item'

class MusicAlbum < Item
    def initialize(publish_date, on_spotify:)
        super(publish_date)
        @on_spotify = on_spotify
    end

    def can_be_archived?
        super() and @on_spotify
    end
end


al = MusicAlbum.new("2020-10-10", on_spotify: true)

puts al.can_be_archived?