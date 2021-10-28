# frozen_string_literal: true

require_relative '../rb/label'
require_relative '../item'

describe Label do
  context 'When the Label class is initialised' do
    new_label = Label.new(0, 'Hope', 'Skype')
    item=Item.new('name', 'RPG', 'author', 'label', '2010-10-10',0)
    it 'Should return an instance of Label' do
      expect(new_label).to be_an_instance_of Label
    end
    it 'Should retun an empty array' do
      expect(new_label.items).to be == []
    end

    it 'should add the input item to the collection of items' do
      new_label.add_item(item)
      expect(new_label.items[0]).to eql item
    end
    it 'should add self as a property of the item object' do
        expect(item.label).to eql new_label
      end
  end
end