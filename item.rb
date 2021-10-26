# frozen_string_literal: true

# Create Item class in a separate .rb file.

require 'date'

class Item
  attr_accessor :name, :genre, :author, :publish_date, :archived, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @name 
    @genre 
    @author 
    @source 
    @label 
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  # in the Item class should return true if published_date is older than 10 years
  def can_be_archived?
    today = Date.today
    total = today.year - publish_date.year
    return true if total > 10

    false
  end

  def self.move_to_archive?
    archived = true if can_be_archived?
  end
end

