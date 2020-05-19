require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('./lib/song')
require('./lib/artist')
require('pry')
require("pg")
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "record_store"})

get('/') do
 redirect to('/artists')
end

get('/albums') do
  @albums = Album.all
  erb(:albums)  
end

post('/albums') do
  name = params[:album_name]
  album = Album.new({:name => name, :id => nil})
  album.save()
  redirect to('/albums')
end

get('/albums/search') do
  if @search_result = Album.search(params[:search])
  erb(:album_search_results)
  else
    erb(:albums)    
  end
end


get('/albums/new') do
  erb(:new_album)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update({:name => params[:name], :artist_name => params[:artist_name]})
  redirect to('/albums')
end

delete('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.delete()
  redirect to('/albums')
end

# Get the detail for a specific song such as lyrics and songwriters.
get('/albums/:id/songs/:song_id') do
  @song = Song.find(params[:song_id].to_i())
  erb(:song)
end

# Post a new song. After the song is added, Sinatra will route to the view for the album the song belongs to.
post('/albums/:id/songs') do
  @album = Album.find(params[:id].to_i())
  song = Song.new({:name => params[:song_name], :album_id => @album.id, :id => nil})
  song.save()
  erb(:album)
end

# Edit a song and then route back to the album view.
patch('/albums/:id/songs/:song_id') do
  @album = Album.find(params[:id].to_i())
  song = Song.find(params[:song_id].to_i())
  song.update(params[:name], @album.id)
  erb(:album)
end

# Delete a song and then route back to the album view.
delete('/albums/:id/songs/:song_id') do 
  song = Song.find(params[:song_id].to_i())
  song.delete
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/artists') do
  @artists = Artist.all
  erb(:artists) 
end

get('/artists/new') do
  erb(:new_artist)
end

get('/artists/search') do
  if @search_result = Artist.search(params[:search])
  erb(:artist_search_results)
  else
    erb(:artists)    
  end
end

get('/artists/:id') do
  @artist = Artist.find(params[:id].to_i())
  erb(:artist)
end

post('/artists') do
  name = params[:artist_name]
  artist = Artist.new({:name => name, :id => nil})
  artist.save()
  redirect to('/artists')
end

patch('/artists/:id') do
  @artist = Artist.find(params[:id].to_i())
  @artist.update(params[:name])
  redirect to('/artists')
end

delete('/artists/:id') do
  @artist = Artist.find(params[:id].to_i())
  @artist.delete()
  redirect to('/artsits')
end

post('/artists/:id') do
  @artist = Artist.find(params[:id].to_i())
  name = params[:album_name]
  @album = Album.new({:name => name, :id => nil})
  @album.save()
  @artist.update({:album_name => @album.name})
  erb(:artist)
end