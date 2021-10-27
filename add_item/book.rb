require_relative '../texts'
require_relative '../classes/categories/book'

def create_book(item)
  Texts.text_ci1('publisher')
  publisher = gets.chomp
  Texts.text_ci2('cover state')
  cover_state = gets.chomp
  book = Book.new(publisher, cover_state, item)
  @books << book
  Texts.success('book')
  book
end
