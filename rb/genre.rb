# frozen_string_literal: true

# Genre object
class Genre
  attr_accessor :name, :id, :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_json(*_args)
    hash = { id: @id, name: @name }
    JSON.generate(hash)
  end

  def display
    puts("#{@id})  name: #{@name}")
  end
end
