require '../item'

class  Genre
    attr_accessor :name, id:

    def initialize(name:)
        @id = Random.rand(1..1000)
        @name = name
        @items = []
    end

    def add_item
        @items <<
    end
end