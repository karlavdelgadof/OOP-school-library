require_relative 'person'

class Student < Person
  def initialize(*all, classroom)
    super(*all)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

# test create new student
new_student = Student.new(18, 'Lindsay', false, 5)
p new_student
