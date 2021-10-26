# frozen_string_literal: true

# Author object
class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(id:, first_name:, last_name:)
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
