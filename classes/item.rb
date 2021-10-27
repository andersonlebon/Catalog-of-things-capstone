require 'date'

class Item
  attr_reader :genre, :author, :source, :label, :archived

  # rubocop: disable Style/OptionalBooleanParameter
  def initialize(id, publish_date, archived = false)
    @id = id
    @publish_date = publish_date
    @archived = archived
    move_to_archive
  end

  # rubocop: enable Style/OptionalBooleanParameter
  def genre=(genre)
    @genre = genre
    @genre.add_item(self)
  end

  def author=(author)
    @author = author
    @author.add_item(self)
  end

  def source=(source)
    @source = source
    @source.add_item(self)
  end

  def label=(label)
    @label = label
    @label.add_item(self)
  end

  def can_be_archived?
    difference_in_days = (Date.today - Date.xmlschema(@publish_date)).to_i
    (difference_in_days / 365.25).to_i > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
