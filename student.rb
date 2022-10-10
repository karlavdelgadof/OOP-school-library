require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(*all, classroom)
    super(*all)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
