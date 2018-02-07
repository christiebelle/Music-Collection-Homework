require('pg')
require_relative('../db/sqlrunner')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize( options )
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if ['id']
    @artist_id = options['artist_id'].to_i
  end


  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SQLRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SQLRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM albums"
    music = SQLRunner.run(sql)
    return music.map{ |album| Album.new(album)}
  end

end
