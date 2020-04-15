require ( 'pry' )
require_relative('../models/album')
require_relative('../models/artist')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new( { "name" => "Gorillas" } )
artist1.save()

artist2 = Artist.new( {"name" => "Metallica"} )
artist2.save()

artist3 = Artist.new( {"name" => "Michael Jackson"} )
artist3.save()


album1 = Album.new( {'title' => 'Gorillaz', 'genre' => 'pop', 'artist_id' => artist2.id} )
album1.save()
album2 = Album.new( {'title' => 'Plastic Beach', 'genre' => 'pop', 'artist_id' => artist1.id} )
album2.save()
album3 = Album.new( {'title' => "Kill 'Em All ", 'genre' => 'Heavy metal', 'artist_id' => artist2.id} )
album3.save()
album4 = Album.new( {'title' => 'Master of Puppets', 'genre' => 'Heavy metal', 'artist_id' => artist2.id} )
album4.save()

artist1.name = "Gorillaz"
artist1.update()
album1.artist_id = artist1.id


binding.pry
nil