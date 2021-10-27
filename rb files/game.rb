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
    source = proto['source']
    label = proto['label']
    genre = proto['genre']

    super(name, genre, author, source, label, publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_json(*_args)
    hash = { name: @name, genre: @genre, author: @author.id, source: @source, label: @label, publish_date: @publish_date,
             id: @id, multiplayer: @multiplayer, last_played_at: @last_played_at }
    JSON.generate(hash)
  end

  def display
    puts("#{@id})  name: #{@name} , genre: #{@genre}, author: #{@author.completename}, source: #{@source}, label: #{@label}, publish date: #{@publish_date}, last played: #{@last_played_at} id: #{@id}")
  end

  def self.move_to_archive?
    @archived = true if can_be_archived? && (Date.new.year - last_played_at.year > 2)
  end
end