class Album
  attr_reader :id
  attr_accessor :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_albums = DB.exec("SELECT * FROM albums")
    albums = []
    returned_albums.each do |album|
      name = album.fetch("name")
      id = album.fetch("id").to_i
      albums.push(Album.new({:name => name, :id => id}))
    end
    albums
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def save
    result = DB.exec("INSERT INTO albums (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
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

