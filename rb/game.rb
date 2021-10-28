# frozen_string_literal: true

require_relative '../item'

# Game object
class Game < Item
  require 'json'
  attr_accessor :multiplayer, :last_played_at

  def initialize(proto, multiplayer, last_played_at)
    name = proto['name']
    id = proto['id']
    publish_date = proto['publish_date']
    author = proto['author']
    label = proto['label']
    genre = proto['genre']

    super(name, genre, author, label, publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def to_json(*_args)
    hash = { name: @name, genre: @genre.id, author: @author.id, label: @label.id, publish_date: @publish_date,
             id: @id, multiplayer: @multiplayer, last_played_at: @last_played_at }
    JSON.generate(hash)
  end

  def display
    puts("#{@id})  name: #{@name} , genre: #{@genre.name}, author: #{@author.completename}, label: #{@label.title}, publish date: #{@publish_date}, last played: #{@last_played_at}")
  end

  def can_be_archived?
    a = false
    b = false
    today = Date.today
    total = today.year - publish_date.year
    a = true if total > 10

    total =  today.year - last_played_at.year
    b = true if total > 2

    (a && b)
  end
end
