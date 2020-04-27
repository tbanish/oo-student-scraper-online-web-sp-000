class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    student_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.collect do |student|
      self.new(student)
    end

  end

  def add_student_attributes(attributes_hash)
    binding.pry
  end

  def self.all
    @@all
  end
end

