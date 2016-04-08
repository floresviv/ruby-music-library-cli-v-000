require_relative './concerns/findable.rb'

class Song
	attr_accessor :name, :artist, :genre
	# include Concerns::Findable
	
	@@all = []

	def initialize(name, artist = nil,  genre = " ")
		@name = name
		@artist = artist
		@genre = genre
	end

	def artist=(name)
		artist = Artist.new(name)
		artist.songs << self
		artist
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