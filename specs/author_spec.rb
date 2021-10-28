# frozen_string_literal: true

require_relative '../rb/author'
require_relative '../item'

describe Author do
  context 'When the Author class is initialised' do
    new_author = Author.new(0, 'Toby', 'Fox')
    item=Item.new('name', 'RPG', 'author', 'label', '2010-10-10',0)
    it 'Should return an instance of Author' do
      expect(new_author).to be_an_instance_of Author
    end
    it 'Should retun an empty array' do
      expect(new_author.items).to be == []
    end

    it 'should add the input item to the collection of items' do
      new_author.add_item(item)
      expect(new_author.items[0]).to eql item
    end
    it 'should add self as a property of the item object' do
        expect(item.author).to eql new_author
      end
  end
end
