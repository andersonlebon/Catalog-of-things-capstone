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
    @last_played_at = last_played_at
  end

  def to_json(*_args)
    hash = { name: @name, genre: @genre.id, author: @author.id, label: @label, publish_date: @publish_date,
             id: @id, multiplayer: @multiplayer, last_played_at: @last_played_at }
    JSON.generate(hash)
  end

  def display
    puts("#{@id})  name: #{@name} , genre: #{@genre.name}, author: #{@author.completename}, label: #{@label}, publish date: #{@publish_date}, last played: #{@last_played_at}")
  end

  def self.move_to_archive?
    @archived = true if can_be_archived? && (Date.new.year - @last_played_at.year > 2)
  end
end
