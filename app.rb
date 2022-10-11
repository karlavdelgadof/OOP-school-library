require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require 'colorize'

class App
  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  def options
    [
      '[0]  =>  List all books',
      '[1]  =>  List all people',
      '[2]  =>  List all students',
      '[3]  =>  List all teachers',
      '[4]  =>  Create a person',
      '[5]  =>  Create a book',
      '[6]  =>  Create a rental',
      '[7]  =>  List all rentals for a given person id',
      '[8]  =>  List all rentals for a given book',
      '[9]  =>  Exit'
    ]
  end

  def run
    user_response = 0
    puts "\n\nWelcome to School Library App!\n\n".colorize(color: :green).bold

    while user_response != '9'
      puts "Please choose an option by entering a number:\n\n".colorize(color: :magenta).italic
      options.each do |choice|
        if choice.include?('Exit')
          puts choice.colorize(color: :red)
        else
          puts choice
        end
      end
      print "\n\nEnter Option [number]: ".colorize(color: :white).bold
      user_response = gets.chomp
      puts "\n\n"
      check_selection(user_response)
    end
    puts "Thank you for using this app!\n\n".colorize(color: :cyan).bold if user_response == '9'
  end

  def check_selection(response)
    case response
    when '0'
      Book.list_all_books(@books)
    when '1'
      Person.list_all_people(@people)
    when '2'
      Student.lits_all_students(@people)
    when '3'
      Teacher.list_all_teachers(@people)
    when '4'
      person = Person.create_person
      @people << person
      puts "\n\nPerson created successfully".colorize(color: :green).italic if @people.include?(person)
    when '5'
      book = Book.create_book
      @books << book
      puts 'Book created successfully' if @books.include?(book)
    when '6'
      rental = Rental.create_rental(@books, @people)
      @rentals << rental
      puts "\n\nRental created successfully".colorize(color: :green).italic if @rentals.include?(rental)
    when '7'
      Person.list_all_rentals_person_id(@people, @rentals)
    when '8'
      Book.list_all_rentals_for_book(@books, @rentals)
    end
  end
end
