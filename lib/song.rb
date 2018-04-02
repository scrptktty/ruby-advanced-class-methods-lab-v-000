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
    # Yields the new instance to the block, and then returns new instance as well.
    #self.new.tap --> barewords fall through to methods
    new.tap { |it| it.save }
  end

  #def self.new
  def initialize(name)
    @name = name
  end

  def self.new_by_name(name)
    new(name)
  end

  def self.create_by_name(name)
    
  end

  def self.find_by_name(name)

  end

  def self.find_or_create_by_name(name)

  end

  def self.alphabetical
    all.sort
  end

  def self.new_from_filename

  end

  def self.create_by_filename

  end

  def self.destroy_all
    all.clear
  end

end
