# frozen_string_literal: true

require_relative '../item'

# Class to create book objects
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(proto, publisher, cover_state)
    name = proto['name']
    id = proto['id']
    publish_date = proto['publish_date']
    author = proto['author']
    label = proto['label']
    genre = proto['genre']

    super(name, genre, author, label, publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*_args)
    hash = { name: @name, genre: @genre.id, author: @author.id, label: @label.id, publish_date: @publish_date,
             id: @id, publisher: @publisher, cover_state: @cover_state }
    JSON.generate(hash)
  end

  def display
    puts("#{@id})  name: #{@name} , genre: #{@genre.name}, author: #{@author.completename}, label: #{@label.title}, publish date: #{@publish_date}, publisher: #{@publisher}, cover state: #{@cover_state}")
  end

  def can_be_archived?
    a = false
    b = false
    today = Date.today
    total = today.year - publish_date.year
    a = true if total > 10

    b = true if @cover_state == 'bad'

    (a || b)
  end
end
