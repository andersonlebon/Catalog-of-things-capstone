# frozen_string_literal: true

# Author object
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(id:, first_name:, last_name:, items:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def self.add_item(item)
    @items.push(item)
    item.author = self
  end
end