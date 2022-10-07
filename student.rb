require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(*all, classroom)
    super(*all)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
