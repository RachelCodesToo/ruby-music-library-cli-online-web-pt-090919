class Song
  extend Concerns::Findable
  
  @@all = []
  
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist!=nil
    self.genre = genre if genre!=nil
  end 
  
  def self.all
    @@all
  end
  
  def self.destroy_all 
    self.all.clear
  end 
  
  def save
    @@all << self 
  end 
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end  
  
  def genre=(genre)
    @genre = genre
    @genre.songs << self if !(@genre.songs.include?(self))
  end 
  
  def self.new_from_filename(file_name)
    
  end 
  
  
  
end