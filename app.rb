require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'

class App
  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  def app_options
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts "\n\n"
  end

  def run
    user_response = 0
    puts "Welcome to School Library App!\n\n"
    while user_response != '7'
      puts "Please choose an option by entering a number:\n\n"
      app_options
      print 'Enter Option [number]: '
      user_response = gets.chomp
      puts "\n\n"
    end
    puts "Thank you for using this app!\n\n" if user_response == '7'
  end

  def check_selection(response)
    case response
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals_person_id
    end
  end

  def list_all_books
    @books.each do |book|
      puts "Title: \"#{book.title}\" Author: #{book.author}"
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)?[Input the number]:'
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

    @people << person

    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)

    @books << book
    puts 'Book created successfully' if @books.include?(book)
  end

  def create_rental
    if @books.empty?
      puts 'You have 0 currently books added. Please add a book.'
    elsif @people.empty?
      puts 'Person not found. Please add a person.'
    else
      puts 'Select a book from the following list by number'
      @books.each do |book|
        puts "#{@books.find_index(book)} - #{book.title}"
      end
      selected_book = gets.to_i
      print 'Date: '
      date = gets.chomp
      puts 'Select a person from the following list by number (not id)'
      @people.each do |person|
        puts "#{@people.find_index(person)} - #{person.name}"
      end
      selected_person = gets.to_i

      rental = Rental.new(date, @books[selected_book], @people[selected_person])

      @rentals << rental
      puts 'Rental created successfully' if @rentals.include?(rental)
    end
  end

  def list_all_rentals_person_id
    list_all_people
    print 'ID of person: '
    person_id = gets.to_i
    puts(@rentals.map do |rental|
      if rental.person.id == person_id
        "Rentals:\nDate: #{rental.date}  Book: #{rental.book.title}"
      else
        'No rentals found for this person'
      end
    end)
  end
end