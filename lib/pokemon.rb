
class Pokemon
attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    # @hp = 60
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES(?,?)", name, type)
  end

# Pokemon .find finds a pokemon from the database by their id number and returns a new Pokemon object

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?",id)
    pokemon.map do |row|
      new_pokemon = Pokemon.new(name: row[1], type: row[2], db: db, id: id)
      new_pokemon.hp = row[3]
      return new_pokemon
    end
  end


  def self.alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

  end
