# frozen_string_literal: true

require_relative '../item'

# Game object
class Game < Item

  require 'json'
  attr_accessor :multiplayer, :last_played_at

  def initialize(name:, genre:, author:, source:, label:, publish_date:, id:, multiplayer:, last_played_at:)
    super(name, genre, author, source, label, publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def self.to_json(*_args)
    hash = { name: @name, genre: @genre, author: @author, source: @source, label: @label, publish_date: @publish_date, id: @id, multiplayer: @multiplayer, last_played_at: @last_played_at  }
    JSON.generate(hash)
  end

  def display(index)
    puts("#{index})  name: #{name} , genre: #{genre}, author: #{author}, source: #{source}, label: #{label}, publish date: #{publish_date} id: #{index}")
  end

  def self.move_to_archive?
    @archived = true if can_be_archived? && (Date.new.year - last_played_at.year > 2)
  end


end
