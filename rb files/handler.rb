# frozen_string_literal: true

require_relative 'console'
require_relative 'game'
require_relative 'author'
require_relative 'filehandler'

class Handler
  include FileHandler
  attr_accessor :games, :authors, :genres, :labels

  def initialize
    @games = []
    @books = []
    @albums = []
    @authors = []
    @genres = []
    @labels = []
  end

  def cr_a_item(id)
    year = '0'
    month = '0'
    day = '0'
    puts('insert a name: ')
    name = gets.chomp
    while year.to_i <= 1
      puts('insert the published year (in numbers)')
      year = gets.chomp
    end
    while month.to_i >= 13 || month.to_i <= 0
      puts('insert the published month (in numbers)')
      month = gets.chomp
    end
    max = days_in_month(year.to_i, month.to_i)
    while day.to_i <= 1 || day.to_i > max
      puts("insert the published day (in numbers, the max is #{max})")
      day = gets.chomp
    end
    publish_date = "#{year}-#{month}-#{day}"
    author = pick_one(@authors, "author")
    {
      'name' => name,
      'id' => id,
      'publish_date' => publish_date,
      'author' => author,
      'label' => 'TBA',
      'genre' => 'TBA',
    }
  end

  def cr_a_game
    year = '0'
    month = '0'
    day = '0'
    proto = cr_a_item(@games.length)
    multiplayer = 'agegraegr'
    while multiplayer != 'Y' && multiplayer != 'N' && multiplayer != 'y' && multiplayer != 'n'
      puts('invalid option, please select Y or N') if multiplayer != 'agegraegr'
      puts('is multiplayer (Y/N)?: ')
      multiplayer = gets.chomp
    end
    multiplayer = if %w[y Y].include?(multiplayer)
                    true
                  else
                    false
                  end
    while year.to_i <= 1
      puts('insert the year were the game was last played (in numbers)')
      year = gets.chomp
    end
    while month.to_i >= 13 || month.to_i <= 0
      puts('insert the month were the game was last played (in numbers)')
      month = gets.chomp
    end
    max = days_in_month(year.to_i, month.to_i)
    while day.to_i <= 1 || day.to_i > max
      puts("insert the day were the game was last played (in numbers, the max is #{max})")
      day = gets.chomp
    end
    last_played_at = "#{year}-#{month}-#{day}"
    new_game = Game.new(proto, multiplayer, last_played_at)
    @games.push(new_game)
    'game created succesfully'
  end

  def cr_a_author
    id = @authors.length
    puts('insert the first name of the author')
    first_name = gets.chomp
    puts('insert the last name of the author')
    last_name = gets.chomp

    new_author = Author.new(id, first_name, last_name)
    @authors.push(new_author)
    'Author created succesfully'
  end

  def go_back
    puts('There should be atleast one author, label and genre')
    Console.continue_story
    'There should be atleast one author, label and genre'
  end

  def enough_categorys
    authors.length >= 1 # && genres.length >=1 && labels.length >=1
  end

  def display_array(array)
    array.each(&:display)
  end

  def listing(array, name)
    if array.length.positive?
      puts("this is the list of #{name} sorted by id")
      puts('')
      display_array(@authors)
    else
      puts("currently there are not #{name} created")
    end
    Console.continue_story
  end

  def pick_one(array, name)
    pick= -1;
    while(pick <0 && pick >=array.length)
      puts("please select an #{name} of the list")
      display_array(array)
      pick = gets.chomp.to_i
      picked = array[pick]
    end
    picked
  end

  def days_in_month(year, month)
    Date.new(year, month, -1).day
  end

  def exit
    save_in_file('authors', @authors)
    save_in_file('labels', @labels)
    save_in_file('genres', @genres)
    save_in_file('games', @games)
    'bye'
  end

  def do(option)
    Console.clean
    case option
    when '1'
      listing(@books, 'books')
    when '2'
      listing(@albums, 'albums')
    when '3'
      listing(@games, 'games')
    when '4'
      listing(@genres, 'genres')
    when '5'
      listing(@labels, 'labels')
    when '6'
      listing(@authors, 'authors')
    when '7'
      if enough_categorys
        # add the book creator function
      else
        go_back
      end
    when '8'
      if enough_categorys
        # add the album creator function
      else
        go_back
      end
    when '9'
      if enough_categorys
        cr_a_game
      else
        go_back
      end
    when '10'
      cr_a_author
    when '11'
      # create a genre
    when '12'
      # create a label
    when '13'
      exit
    end
  end
end
