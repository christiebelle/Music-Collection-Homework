require('pg')
require_relative('../db/sqlrunner')

class Artist

  attr_reader :id, :name

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SQLRunner.run(sql, values)[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SQLRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    singers = SQLRunner.run(sql)
    return singers.map{ |artist| Artist.new(artist)}
  end
end
