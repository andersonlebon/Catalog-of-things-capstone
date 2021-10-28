# frozen_string_literal: true

require_relative 'handler'

# Have all the functions related to manipulate files
module FileHandler
  def save_in_file(name, array)
    if array.length.positive?
      serial = []
      array.each do |i|
        serial.push(i.to_json)
      end
      Dir.mkdir('json') unless File.exist?('json')
      File.write("json/#{name}.json", serial.join("\n"), mode: 'w')
    end
  end

  def getproto(line)
    {
      'name' => line['name'],
      'id' => line['id'],
      'publish_date' => line['publish_date'],
      'author' => @authors[line['author']],
      'label' => @labels[line['label']],
      'genre' => @genres[line['genre']]
    }
  end

  def load_all
    open_file('genres')
    open_file('authors')
    open_file('labels')
    open_file('games')
    open_file('books')
    open_file('albums')
  end

  def open_file(file_name)
    if File.exist?("json/#{file_name}.json")
      File.open("json/#{file_name}.json", 'r') do |file|
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
    when 'labels'
      id = line['id']
      title = line['title']
      color = line['color']
      new_label = Label.new(id, title, color)
      @labels.push(new_label)
    when 'authors'
      id = line['id']
      first_name = line['first_name']
      last_name = line['last_name']
      new_author = Author.new(id, first_name, last_name)
      @authors.push(new_author)
    when 'genres'
      id = line['id']
      name = line['name']
      new_genre = Genre.new(id, name)
      @genres.push(new_genre)
    when 'games'
      proto = getproto(line)
      last_played_at = line['last_played_at']
      multiplayer = line['multiplayer']
      new_game = Game.new(proto, multiplayer, last_played_at)
      @games.push(new_game)
    when 'albums'
      line = getproto(line)
      name = line['name']
      id = line['id']
      publish_date = line['publish_date']
      author = line['author']
      label = line['label']
      genre = line['genre']
      on_spotify = line['on_spotify']
      puts(publish_date)
      new_album = MusicAlbum.new(name, genre, author, label, publish_date, on_spotify, id)
      @albums.push(new_album)
    when 'books'
      proto = getproto(line)
      publisher = line['publisher']
      cover_state = line['cover_state']
      new_book = Book.new(proto, publisher, cover_state)
      @books.push(new_book)
    end
  end
end
