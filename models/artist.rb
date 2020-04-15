require('pg')
require_relative('../db/sql_runner')
require_relative('album')

class Artist
    attr_accessor :name
    attr_reader :id

    def initialize(options)
        @id = options['id'] if options['id']
        @name = options['name']
    end

    def save()
        sql = "INSERT INTO artists
        (name) 
        VALUES 
        ($1)
        RETURNING id"
        values = [@name]
        @id = SqlRunner.run(sql, values)[0]["id"].to_i
      end
        
    def self.all()
        sql = "SELECT * FROM artists"
        artists = SqlRunner.run(sql)
        return artists.map { |artist| Artist.new(artist) }
    end

    def delete()
        sql = "DELETE FROM albums where artist_id = $1"
        values = [@id]
        SqlRunner.run(sql, values)

        sql = "DELETE FROM artists where id = $1"
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM artists"
        SqlRunner.run(sql)
    end

end