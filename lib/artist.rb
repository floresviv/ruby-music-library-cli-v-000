require_relative './concerns/findable.rb'

class Artist

	attr_accessor :name, :song, :genre

	include Concerns::Findable

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def songs
		@songs
	end

	def add_song(song)
		if self.songs.find(song)
			song
		else
			self.songs << song
		end
		if song.artist == self
			self
		else
			song.artist = self
		end
	end

	def self.all 
		@@all
	end

	def save
		self.class.all << self
	end

	def self.create(name)
		artist = self.new(name)
		artist.save
		artist
	end

	def self.destroy_all
		self.all.clear
	end

	def genres
		genres = []
		self.songs.collect do |song|
			genres << song.genre
			genres.uniq
		end
	end
end