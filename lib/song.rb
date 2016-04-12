require_relative './concerns/findable.rb'

class Song
	attr_accessor :name, :artist, :genre
	# include Concerns::Findable
	
	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		@artist = artist if artist
		@genre = genre if genre
		@@all << self
	end

	def artist=(some_artist)
		@artist = some_artist
		some_artist.songs << self
		some_artist.add_song(self)
	end

	def genre=(some_genre)
		@genre = some_genre
		if some_genre.songs.include?(self)
			self
		else
			some_genre.songs << self
		end
	end

	def self.all
		@@all
	end

	def save
		@@all << self
	end

	def self.create(name)
		song = self.new(name)
		song.save
		song
	end

	def self.destroy_all
		self.all.clear
	end

end