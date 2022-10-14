require 'json'

class UserOutput
  def self.load_people(people)
    return people unless File.exist?('./data/people.json')

    object = JSON.parse(File.read('./data/people.json'))
    object.each do |person|
      if person['class'] == 'Teacher'
        teacher = Teacher.new(person['age'], person['name'], person['parent_permission'], person['specialization'])
        teacher.id = person['id']
        people << teacher
      else
        student = Student.new(person['age'], person['name'], person['parent_permission'], person['classroom'])
        student.id = person['id']
        people << student
      end
    end
  end

  def self.load_books(books)
    return books unless File.exist?('./data/books.json')

    object = JSON.parse(File.read('./data/books.json'))
    object.each do |book|
      book_json = Book.new(book['title'], book['author'])
      books << book_json
    end
  end

  def self.load_rentals(books, people, rentals)
    return rentals unless File.exist?('./data/rentals.json')

    object = JSON.parse(File.read('./data/rentals.json'))
    object.each do |rental|
      book_title = books.find do |book|
        book.title == rental['book']
      end
      person_id = people.find do |person|
        person.id == rental['person']
      end
      rental_json = Rental.new(rental['date'], book_title, person_id)
      rentals << rental_json
    end
  end

  def self.load_data(people, books, rentals)
    load_people(people)
    load_books(books)
    load_rentals(books, people, rentals)
  end
end
