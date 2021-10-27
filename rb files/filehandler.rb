# frozen_string_literal: true

require_relative 'handler'

module FileHandler
  def save_in_file(name, array)
    if array.length.positive?
      serial = []
      array.each do |i|
        serial.push(i.to_json)
      end
      File.write("jsons/#{name}.json", serial.join("\n"), mode: 'w')
    end
  end

  def getproto(line)
    {
      'name' => line['name'],
      'id' => line['id'],
      'publish_date' => line['publish_date'],
      'author' => @authors[line['author']],
      'label' => 'TBA',
      'source' => 'TBA',
      'genre' => 'TBA'
    }
  end

  def load_all
    open_file('authors')
    open_file('games')
  end

  def open_file(file_name)
    if File.exist?("json/#{file_name}.json")
      File.open("#{file_name}.json", 'r') do |file|
        file.readlines.each do |line|
          insert(line, file_name)
        end
        file.close
      end
    end
    false
  end

  def insert(line, file_name)
    line = JSON.parse(line)
    case file_name
    when 'authors'
      id = line['id']
      first_name = line['first_name']
      last_name = line['last_name']
      new_author = Author.new(id, first_name, last_name)
      @authors.push(new_author)
    when 'games'
      proto = getproto(line)
      last_played_at = line['last_played_at']
      multiplayer = line['multiplayer']
      new_game = Game.new(proto, multiplayer, last_played_at)
      @games.push(new_game)
    end
  end
end
