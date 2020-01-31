require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    return new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    return Song.all.select{|song| song_name == song.name}[0]
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    Song.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    new_song = self.new
    new_song.name = filename.split(".")[0].split(" - ")[1]
    new_song.artist_name = filename.split(".")[0].split(" - ")[0]
    new_song
  end

  def Song.create_from_filename(filename)
    new_song = self.new
    new_song.name = filename.split(".")[0].split(" - ")[1]
    new_song.artist_name = filename.split(".")[0].split(" - ")[0]
    @@all << new_song
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

end

