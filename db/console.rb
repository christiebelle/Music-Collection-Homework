require("pry")
require_relative('../models/album')
require_relative('../models/artist')

Artist.delete_all
Album.delete_all


artist1 = Artist.new({ 'name' => 'Take That'})
artist1.save

artist2 = Artist.new({ 'name' => 'Backstreet Boys'})
artist2.save

artist3 = Artist.new({ 'name' => 'East 17'})
artist3.save


album1 = Album.new({
  'title' => 'Take That and Party',
  'genre' => 'pop',
  'artist_id' => artist1.id,
  })

album2 = Album.new({
  'title' => 'Millennium',
  'genre' => 'pop',
  'artist_id' => artist1.id
  })

album3 = Album.new({
  'title' => 'Walthamstow',
  'genre' => 'dance',
  'artist_id' => artist1.id
  })

album1.save()
album2.save()
album3.save()
