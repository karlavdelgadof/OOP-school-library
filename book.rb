class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def self.list_all_books(books)
    books.each do |book|
      puts "Title: \"#{book.title}\" Author: #{book.author}"
    end
  end

  def self.create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new(title, author)
  end

  def create_rental(person, date)
    Rental.new(date, self, person)
  end

  def self.list_all_rentals_for_book(books, rentals)
    list_all_books(books)
    print 'Enter Book Title: '
    book_title = gets.chomp
    puts(rentals.map do |rental|
      if rental.book.title == book_title
        "Rentals:\nDate: #{rental.date}  Rented by: #{rental.person.name} (#{rental.person.id}"
      else
        'No rentals found for this book'
      end
    end)
  end
end
