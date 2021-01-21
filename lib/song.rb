require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save #instance method 
    self.class.all << self #Song.all << instance_of_song 
  end

  def self.create #class method 
    song = self.new 
    self.all << song 
    song 
  end 

  def self.new_by_name(name) #input of a string as name of song
    song = self.new
    song.name = name 
    song 
  end 

  def self.create_by_name(name) #takes string name; returns song instance 
    song = self.new_by_name(name)
    song.save  
    song 
  end 

  def self.find_by_name(name) #takes string name; returns the matching instance
    self.all.find {|song| song.name == name} #find the name property
  end 

  def self.find_or_create_by_name(name) #accept string name
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end 
  end  
      
  def self.alphabetical 
    self.all.sort_by {|song| song.name}
  end 

  def self.new_from_filename(filename) # "Taylor Swift - Blank Space.mp3"
    file = filename.split(" - ")
    song = self.new 
    song.artist_name = file[0]
    song.name = file[1].delete_suffix(".mp3")
    song 
  end 

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    self.all << song 
  end 

  def self.destroy_all
    self.all.clear 
  end 

end
