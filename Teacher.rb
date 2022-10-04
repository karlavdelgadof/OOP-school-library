require_relative "Person"

class Teacher < Person
  def initialize(*all, specialization)
    super(*all)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

# test create new teacher
new_teacher = Teacher.new(32, "Alex", "Math")
p new_teacher