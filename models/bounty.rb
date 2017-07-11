
require('pg')

class Bounty

  attr_reader :id
  attr_accessor :name, :species, :bounty_value, :homeworld

  def initialize(options)
    @name = options['name']
    @species = options['species']
    @bounty_value = options['bounty_value']
    @homeworld = options['homeworld']
    @id = options['id'].to_i if options['id']
  end

  def save()
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )
    sql = "INSERT INTO bounty_hunter
      (name, species, bounty_value, homeworld)
      VALUES 
      ('#{name}', '#{species}', #{bounty_value}, '#{homeworld}') 
      RETURNING id;"
    @id = db.exec(sql)[0]['id'].to_i
    db.close
  end

  def update()
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )
    sql = "UPDATE bounty_hunter SET
      (name, species, bounty_value, homeworld) =
      ('#{name}', '#{species}', '#{bounty_value}', '#{homeworld}') 
      WHERE id = #{@id};"
    @id = db.exec(sql)
    db.close
  end

  def delete()
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )
    sql = "DELETE FROM bounty_hunter WHERE id = #{@id}"
    @id = db.exec(sql)
    db.close
  end

  def self.delete_all()
    db = PG.connect( { dbname: 'bounty_hunter', host: 'localhost' } )
    sql = "DELETE FROM bounty_hunter"
    db.exec(sql)
    db.close
  end

  def self.find(id)
    db = PG.connect( {dbname: 'bounty_hunter', host: 'localhost' } )
    sql = "SELECT * FROM bounty_hunter WHERE id = #{id}"
    result = db.exec(sql)
    db.close
    return Bounty.new(result[0])
  end

end
