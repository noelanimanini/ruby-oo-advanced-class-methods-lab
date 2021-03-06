require 'pry'
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
    song = self.new
    song.save
    song
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end 

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end 

  def self.find_by_name(name)
    # binding.pry
    @@all.detect {|song| song.name == name}
  end 

  def self.find_or_create_by_name(name) 
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end 
  end 

  def self.alphabetical
    @@all.sort {|a,b| a.name <=> b.name}
    # binding.pry
  end

  def self.new_from_filename(file_name)
    data = file_name.split(/( - |\.)/)
    song = self.new
    song.name = data[2]
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(file_name)
    song2 = self.new_from_filename(file_name)
    self.all << song2
  end

  def self.destroy_all
    self.all.clear
  end 
end
