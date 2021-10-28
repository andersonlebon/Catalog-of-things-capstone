# frozen_string_literal: true

require_relative '../rb/book'

describe Book do
  context 'When Book is initialised' do
    proto =
      {
        'name' => 'Una Muerte Anuciada',
        'id' => 0,
        'publish_date' => '2020-10-10',
        'author' => 'Gabriel Garcia',
        'label' => 'Best',
        'genre' => 'Drama'
      }
    prototwo =
      {
        'name' => 'Don Quixote',
        'id' => 0,
        'publish_date' => '2012-10-10',
        'author' => 'Shekspeare',
        'label' => 'Best',
        'genre' => 'Drama'
      }
    recent_book = Book.new(proto, 'old', 'bad')
    old_book = Book.new(prototwo, 'old', 'good')
    it 'Should return an instance of the Class Book' do
      expect(recent_book).to be_an_instance_of Book
    end
    it "should return true if parent's method returns true or if cover state is bad " do
      expect(recent_book.can_be_archived?).to be true
    end
    it 'Otherwise, should return false' do
      expect(old_book.can_be_archived?).to be false
    end
  end
end
