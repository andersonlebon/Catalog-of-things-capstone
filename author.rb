# frozen_string_literal: true

# Author object
class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items<< item
  end

  def get_h(*_args)
    hash = { id: @id, first_name: @first_name, last_name: @last_name }
    hash
  end

  def completename
    "#{@first_name} #{@last_name}"
  end
end
