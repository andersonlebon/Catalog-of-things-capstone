# frozen_string_literal: true

# Create Item class in a separate .rb file.

require 'date'

# Contain information shared in all items
class Item
  attr_accessor :name, :genre, :author, :publish_date, :archived, :label

  def initialize(name, genre, author, label, publish_date, id)
    @id = id
    @name = name
    @genre = genre
    @author = author
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = false

    author.add_item(self) if @author.respond_to? :add_item
    genre.add_item(self) if @genre.respond_to? :add_item
    author.add_item(self) if @label.respond_to? :add_item
  end

  # in the Item class should return true if published_date is older than 10 years
  def can_be_archived?
    today = Date.today
    total = today.year - publish_date.year
    return true if total > 10

    false
  end

  def move_to_archive?
    @archived = true if can_be_archived?
  end
end
