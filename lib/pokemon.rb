class Pokemon
    attr_accessor :id, :name, :type, :db, :hp
    @@all = []

    def initialize(id:, name:, type:, db:, hp: nil)
        self.id = id
        self.name = name
        self.type = type
        self.db = db
        self.hp = hp
        Pokemon.all << self
    end

    def self.all
        @@all
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
    end

    def self.find(id, db)
        new_pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
        new_pokemon = Pokemon.new(id: new_pokemon_array[0][0], name: new_pokemon_array[0][1], type: new_pokemon_array[0][2], hp: new_pokemon_array[0][3], db: db)
    end

    def alter_hp(hp, db)
        db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, self.id)
    end
end

