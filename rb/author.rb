# frozen_string_literal: true

# Author object
class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end

  def to_json(*_args)
    hash = { id: @id, first_name: @first_name, last_name: @last_name }
    JSON.generate(hash)
  end

  def completename
    "#{@first_name} #{@last_name}"
  end

  def display
    puts("#{@id})  first name: #{@first_name} , last name: #{@last_name}")
  end
end
