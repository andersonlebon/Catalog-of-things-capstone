# frozen_string_literal: true

require_relative '../item'

# To create album objects
class MusicAlbum < Item
  def initialize(name, genre, author, label, publish_date, on_spotify, id)
      super(name, genre, author, label, publish_date, id)
      @on_spotify = on_spotify
  end

  def can_be_archived?
      super() and @on_spotify
  end

  def to_json 
      date = "#{@publish_date.year}-#{@publish_date.month}-#{@publish_date.day}"
      hash = { id: @id, name: @name, genre: @genre.id, author: @author.id, published_date: date, on_spotify: @on_spotify}
      JSON.generate(hash)
  end

  
  def display
    puts("#{@id})  name: #{@name} , genre: #{@genre.name}, author: #{@author.completename}, publish date: #{@publish_date}")
  end
end
