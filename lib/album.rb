class Album
  attr_reader :id, :name
  attr_accessor :name
  @@albums = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@albums.values()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id)
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name)
    @name = name
  end

  def delete
    @@albums.delete(self.id)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.search(name)
    array = @@albums.values.select {|album| album.name == name}
    return array
  end

  def self.sort()
    record_list = @@albums.values
    record_list.each 
    record_list.sort_by{ |record| record.name} 
  end
end

