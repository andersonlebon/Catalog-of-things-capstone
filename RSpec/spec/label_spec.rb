require './classes/attributes/label'
require './classes/item'

describe Label do
  before :each do
    @item = Item.new(Time.now.to_i, '2000-10-10', true)
    @label = Label.new('Brave new world', 'Red')
    @item.label = @label
  end

  describe '#test methods of class label' do
    it 'returns #label title matches "Brave new world"' do
      expect(@item.label.title).to(eq('Brave new world'))
    end
    it 'returns #label color matches "Red"' do
      expect(@item.label.color).to(eq('Red'))
    end
    it 'returns #@items[0] matches "@items"' do
      expect(@label.items[0]).to(eq(@item))
    end
  end
end
