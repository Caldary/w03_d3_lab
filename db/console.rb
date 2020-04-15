require ( 'pry' )
require_relative('../models/album')
require_relative('../models/artist')

artist1 = Artist.new( { "name" => "Gorillaz" } )
artist1.save()

artist2 = Artist.new( {"name" => "Metalica"} )
artist2.save()


album1 = Album.new( {'title' => 'Clint Eastwood', 'genre' => 'pop', 'artist_id' => artist1.id} )
album2 = Album.new( {'title' => 'Melancholy hill', 'genre' => 'pop', 'artist_id' => artist1.id} )
album1.save()
album2.save()


binding.pry
nil