require_relative 'person'

class Teacher < Person
  def initialize(*all, specialization)
    super(*all)
    @specialization = specialization
  end

  def self.create_teacher(age, name)
    print 'specialization: '
    specialization = gets.chomp
    new(age, name, true, specialization)
  end

  def self.list_all_teachers(people)
    people.each do |person|
      if person.class.to_s == 'Student'
        'No teachers found, choose a different option to register a new teacher'
      else
        puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def can_use_services?
    true
  end
end
