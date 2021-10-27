require './classes/categories/book'
require './classes/item'

describe Book do
  before :each do
    item = { id: Time.now.to_i, publish_date: '2000-10-10', archived: true }
    @book = Book.new('Atenea Books', 'good', item)
  end

  describe '#test methods of class book' do
    it 'returns #publisher matches "Atenea Book"' do
      expect(@book.publisher).to(eq('Atenea Books'))
    end
    it 'returns #cover_state" equals matches "good"' do
      expect(@book.cover_state).to(eq('good'))
    end
    it 'returns true if publish_date is more than 10 years' do
      expect(@book.can_be_archived).to(eq(true))
    end
  end
end
