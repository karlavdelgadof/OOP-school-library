require 'json'

class UserInput
  def self.save_people(people)
    people_json = []
    people.each do |person|
    unless person.class.to_s == 'Teacher'
      person = { 
        id: person.id.to_s, 
        class: person.class.to_s, 
        name: person.name, 
        age: person.age,
        classroom: person.classroom,
        parent_permission: person.parent_permission.to_s
      }
      people_json << person
    else 
      person = { 
        id: person.id.to_s, 
        class: person.class.to_s, 
        name: person.name, 
        age: person.age,
        specialization: person.specialization,
        parent_permission: person.parent_permission.to_s
      }

      people_json << person
    end
    File.write("./data/people.json", JSON.pretty_generate(people_json, {indent: "\t", object_nl: "\n"}))
    end   
  end

  def self.save_books(books)
    books_json = []
    books.each do |book|
      book = { title: book.title, author: book.author}
      books_json << book
    end
    File.write("./data/books.json", JSON.pretty_generate(books_json, {indent: "\t", object_nl: "\n"}))
  end

  def self.save_rentals(rentals)
    rentals_json =[]
    rentals.each do |rental|
      rental = { 
        date: rental.date, 
        book: rental.book.title, 
        person: rental.person.id.to_s
      }
      rentals_json << rental
    end
    File.write("./data/rentals.json", JSON.pretty_generate(rentals_json, {indent: "\t", object_nl: "\n"}))
  end

  def self.save_data(people, books, rentals)
    save_people(people)
    save_books(books)
    save_rentals(rentals)
  end

end