# frozen_string_literal: true

require 'json'
require_relative '../item'

# Game object
class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(name:, genre:, author:, source:, label:, publish_date:, id:, multiplayer:, last_played_at:)
    super(name, genre, author, source, label, publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def self.move_to_archive?
    @archived = true if can_be_archived? && (Date.new.year - last_played_at.year > 2)
  end
end
