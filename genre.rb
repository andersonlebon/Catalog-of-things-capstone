# frozen_string_literal: true

class Genre
  attr_accessor :name, :id, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def get_h
    {name: @name, id: @id, items: @items}
  end
end
