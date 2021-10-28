# frozen_string_literal: true

# Class to create label objects
class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(id, title, color)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end

  def to_json(*_args)
    hash = { id: @id, title: @title, color: @color }
    JSON.generate(hash)
  end

  def display
    puts("#{@id})  title: #{@title} , color: #{@color}")
  end
end
