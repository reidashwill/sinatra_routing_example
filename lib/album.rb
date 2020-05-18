class Album
  attr_reader :id
  attr_accessor :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    @@albums.values()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.year, self.genre, self.artist)
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
    Album.all.sort {|a,b| a.name <=> b.name}
    end  
  
  def songs
    Song.find_by_album(self.id)
  end 
end

