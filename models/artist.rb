require('pg')
require_relative('../db/sqlrunner')

class Artist

  attr_accessor :id, :name

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

  def album_list()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    discography = SQLRunner.run(sql, values)
    result = discography.map{ |music| Album.new(music)}
    return result
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SQLRunner.run(sql, values)
  end

    def self.find(id)
      db = PG.connect({ dbname: 'pizza_shop', host: 'localhost' })
      sql = "SELECT * FROM pizza_orders WHERE id = #{id}"
      values = [id]
      db.prepare("find", sql)
      results = db.exec_prepared("find", values)
      db.close()
      order_hash = results.first
      order = PizzaOrder.new(order_hash)
      return order
    end

  end
