require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!

@db.execute("INSERT INTO pokemon (id, name, type) VALUES (1,'Test','Testtype')")