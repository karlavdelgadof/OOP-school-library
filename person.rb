require_relative 'nameable'
require_relative 'decorator'
require_relative 'capitalize_dec'
require_relative 'trim_dec'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def create_rental(_rental)
    Rental.new(date, self, book)
  end

  def self.create_person
    print 'Do you want to create a student (1) or a teacher (2)?[Input the number]: '
    person_choice = gets.chomp
    if person_choice != '1' && person_choice != '2'
      puts 'Invalid option'
    else
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp

      case person_choice
      when '1'
        print 'Has parent permission? [Y/N]: '
        parent_permission = gets.chomp
        parent_permission = parent_permission.downcase == 'y'
        print 'Please enter a classroom: '
        classroom = gets.chomp
        person = Student.new(age, name, parent_permission, classroom)
      when '2'
        print 'specialization: '
        specialization = gets.chomp
        person = Teacher.new(age, name, true, specialization)
      end
    end
  end

  def self.list_all_people(people)
    unless people.empty?
      people.each do |person|     
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else 
      "No people found, choose a different option to register a new person"
    end
  end

  def self.list_all_rentals_person_id(people, rentals)
    list_all_people(people)
    print 'ID of person: '
    person_id = gets.to_i
    puts(rentals.map do |rental|     
      if rental.person.id == person_id
        "Rentals:\nDate: #{rental.date}  Book: #{rental.book.title}"
      else
        'No rentals found for this person'
      end
    end)
  end
  
  private

  def of_age?
    @age >= 18
  end
end
