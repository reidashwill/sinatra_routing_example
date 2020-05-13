class Album
  attr_reader :id, :name
  attr_accessor :name, :year, :genre, :artist
  @@albums = {}
  @@total_rows = 0

  def initialize(name, id, year, genre, artist)
    @name = name
    @id = id || @@total_rows += 1
    @year = year
    @genre = genre
    @artist = artist
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

