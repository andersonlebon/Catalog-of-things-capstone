# frozen_string_literal: true

require_relative 'game'
require_relative 'author'

class Handler
  attr_accessor :games, :authors, :genres, :sources, :labels

  def initialize
    @games = []
    @authors = []
    @genres = []
    @sources = []
    @labels = []
  end

  def cr_a_item(id)
    puts('insert a name: ')
    name = gets.chomp
    puts('insert the published year (in numbers)')
    year = gets.chomp
    puts('insert the published month (in numbers)')
    month = gets.chomp
    puts('insert the published day (in numbers)')
    day = gets.chomp
    publish_date = "#{year}-#{month}-#{day}"
    {
      'name' => name,
      'id' => id,
      'publish_date' => publish_date,
      'author' => author,
      'label' => 'TBA',
      'genre' => 'TBA',
      'source' => 'TBA'
    }
  end

  def cr_a_game
    proto = cr_a_item(@games.length)
    multiplayer = 'agegraegr'
    while multiplayer != 'Y' && multiplayer != 'N' && multiplayer != 'y' && multiplayer != 'n'
      puts('invalid option, please select Y or N') if permission != 'agegraegr'
      puts('is multiplayer (Y/N)?: ')
      multiplayer = gets.chomp
    end
    multiplayer = if %w[y Y].include?(multiplayer)
                    true
                  else
                    false
                  end
    puts('insert the year were the game was last played (in numbers)')
    year = gets.chomp
    puts('insert the month were the game was last played (in numbers)')
    month = gets.chomp
    puts('insert the day were the game was last played (in numbers)')
    day = gets.chomp
    last_played_at = "#{year}-#{month}-#{day}"
    new_game = Game.new(proto, multiplayer, last_played_at)
    @games.push(new_game)
  end

  def cr_a_author
    id = @authors.length
    puts('insert the first name of the author')
    first_name = gets.chomp
    puts('insert the last name of the author')
    last_name = gets.chomp

    new_author = Author.new(id, first_name, last_name)
    @authors.push(new_author)
  end

  def do(option)
    case option
    when '12'
      cr_a_game
      'game created succesfully'
    when '13'
      cr_a_author
      'author created succesfully'
    end
  end
end
