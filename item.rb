# frozen_string_literal: true

require_relative 'corrector'

# Create Item class in a separate .rb file.

require 'date'

class Person
  attr_accessor :name, :genre, :author, :publish_date, :archived

  def initialize(_name, _age, _parent_permission, id)
    @id = id
    @genre = genre
    @author = author
    @source = source
    @publish_date = publish_date
    @archived = archived
  end

  # in the Item class should return true if published_date is older than 10 years
  def can_be_archived?
    today = Date.today
    total = today.year - publish_date.year
    total -= 1 if today < @publish_date + total.year

    return true if total > 10

    false
  end
end
