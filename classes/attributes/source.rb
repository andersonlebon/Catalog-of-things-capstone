class Source
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name)
    @id = Time.now.to_i
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
