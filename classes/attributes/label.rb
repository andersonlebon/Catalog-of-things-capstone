class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title, color)
    @id = Time.now.to_i
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
