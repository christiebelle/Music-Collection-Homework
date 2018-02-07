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

  def delete_all()
    sql = "DELETE FROM artists"
    SQLRunner.run(sql)
  end

# def self.all
#   sql = "SELECT * FROM customers"
#   customers = SQLRunner.run(sql)
#   return customers.map{ |person| Customer.new(person)}
# end
#
# def pizza_order()
#   sql = "SELECT * FROM pizza_orders WHERE customer_id = $1"
#   values = [@id]
#   orders = SQLRunner.run(sql, values)
#   result = orders.map{ |pizza| PizzaOrder.new(pizza)}
#   return result
# end


end
