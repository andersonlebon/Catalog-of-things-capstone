require './classes/item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, item)
    super(item[:id], item[:publish_date], item[:archived])
    @publisher = publisher
    @cover_state = cover_state
    can_be_archived
  end

  def can_be_archived
    response = false
    response = true if can_be_archived? || @cover_state == 'bad'
    response
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [id: @id,
                 archived: @archived,
                 publish_date: @publish_date,
                 publisher: @publisher,
                 cover_state: @cover_state,
                 genre_name: @genre.name,
                 author_first_name: @author.first_name,
                 author_last_name: @author.last_name,
                 source_name: @source.name,
                 label_title: @label.title,
                 label_color: @label.color]
    }.to_json(*args)
  end
end
