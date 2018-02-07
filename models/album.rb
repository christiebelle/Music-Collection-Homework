require('pg')
require_relative('../db/sqlrunner')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize( options )
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if ['id']
    @artist_id = options['id'].to_i
  end


  def save()
    sql = "INSERT INTO albums (title, genre) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SQLRunner.run(sql, values)[0]['id'].to_i
  end

  def delete_all()
    sql = "DELETE FROM artists"
    SQLRunner.run(sql)
  end
