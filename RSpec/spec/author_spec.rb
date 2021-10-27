require './classes/attributes/author'
require './classes/item'

describe Author do
  before :each do
    @item = Item.new(Time.now.to_i, '2000-10-10', true)
    @author = Author.new('Aarnio', 'Kaukkua')
    @item.author = @author
    @author.add_item(@item)
  end

  describe '#test methods of class author' do
    it 'returns #author matches "Aarnio"' do
      expect(@item.author.first_name).to(eq('Aarnio'))
    end
    it 'returns #last_name matches "Kaukkua"' do
      expect(@item.author.last_name).to(eq('Kaukkua'))
    end
    it 'returns #@items[0] matches "@items"' do
      expect(@author.items[0]).to(eq(@item))
    end
  end
end
