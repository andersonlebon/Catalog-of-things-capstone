

# Example object
class Example
    attr_accessor
  
    def initialize(id, propiety_A, propiety_B)
      @id = id
      @propiety_A = propiety_A
      @propiety_B = propiety_B
      @items = []
    end
  
    def add_item(item)
      @items.push(item)
      item.author = self
    end
  
    def to_json(*_args)
      hash = { id: @id, first_name: @propiety_A, last_name: @propiety_B }
      JSON.generate(hash)
    end
  
    def display
      puts("#{@id})  propiety_A: #{@propiety_A} , propiety_B: #{@propiety_B}")
    end
  end