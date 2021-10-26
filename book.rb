require_relative "item"

class Book < Item

  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, *args )
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end
end

book = Book.new(publisher: "Mike", cover_state: "bad", publish_date: "2020-05-05")
p book 