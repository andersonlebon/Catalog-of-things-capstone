# frozen_string_literal: true

require_relative '../rb/genre'

describe Genre do
  context 'When the Genre class is initialised' do
    new_genre = Genre.new(0, 'Comedy')
    item=Item.new('name', 'rock', 'author', 'label', '2010-10-10',0)
    it 'Should return an instance of Genre' do
      expect(new_genre).to be_an_instance_of Genre
    end
    it 'Should retun an empty array' do
      expect(new_genre.items).to be == []
    end

    it 'should add the input item to the collection of items' do
        new_genre.add_item(item)
        expect(new_genre.items[0]).to eql item
    end
    
    it 'should add self as a property of the item object' do
        expect(item.genre).to eql new_genre
      end
  end
end
