require "pry"

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def self.create
    # Yields the new instance to the block, and then returns new instance as well.
    #self.new.tap --> barewords fall through to methods
    new.tap { |it| it.save }
  end

  #def self.new


  def self.new_by_name(name)
    new(name)
  end

  def self.create_by_name(name)
    new(name).tap { |it| it.save }
  end

  def self.find_by_name(find_name)
    self.all.detect { |song| song.name == find_name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(name)
    file_name = name.scan /\w+\W/
    file_name.join(" ")
    artist_name = file_name.split.first
  end

  def self.create_by_filename

  end

  def self.destroy_all
    all.clear
  end

  def initialize(name = "Song not found")
    @name = name
  end

  def name
    @name
  end

  def save
    self.class.all << self
  end
end
