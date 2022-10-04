class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = "Unknown", parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private
  def is_of_age?
    @age <= 18
  end
end

# test create new person
person_1 = Person.new( 16, "Matt", false)
p person_1.can_use_services?