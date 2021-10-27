require_relative '../texts'
require_relative '../classes/item'
require_relative './book'
require_relative './movie'
require_relative './game'
require_relative './music_album'
require_relative '../classes/attributes/author'
require_relative '../classes/attributes/genre'
require_relative '../classes/attributes/label'
require_relative '../classes/attributes/source'
# rubocop:disable all
def add_item
  Texts.text_cr_categories
  option = gets.chomp
  @category = nil
  puts 'What is the title on the label?'
  title = gets.chomp

  puts 'What is the color of the label?'
  color = gets.chomp

  puts 'What is the source? (ie: a shop, a friend...)'
  source = gets.chomp

  puts 'What genre is it?'
  genre = gets.chomp

  puts "What is the author's first name?"
  first_name = gets.chomp

  puts "What is the author's last name?"
  last_name = gets.chomp

  puts 'When was it published (yyyy-mm-dd)?'
  publish_date = gets.chomp


  @item = Item.new(Time.now.to_i, publish_date)
  new_label = Label.new(title, color)
  new_source = Source.new(source)
  new_genre = Genre.new(genre)
  new_author = Author.new(first_name, last_name)
  @labels << new_label unless @labels.any? { |l| l.title == new_label.title }
  @sources << new_source unless @sources.any? { |s| s.name == new_source.name }
  @authors << new_author unless @authors.any? { |a| a.first_name == new_author.first_name }
  @genres << new_genre unless @genres.any? { |g| g.name == new_genre.name }

  data = { id: Time.now, publish_date: publish_date }

  if option == '1'
    @category = 'book'
    item = create_book(data)
  end

  if option == '2'
    @category = 'music album'
    item = create_music_album(data)
  end

  if option == '3'
    @category = 'movie'
    item = create_movie(data)
  end

  if option == '4'
    @category = 'game'
    item = create_game(data)
  end

  item.label = new_label
  item.source = new_source
  item.genre = new_genre
  item.author = new_author
  @items << item
end
# rubocop:enable all