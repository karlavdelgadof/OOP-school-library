require 'json'

class UserOutput
  def self.load_people(people)
    return people unless File.exists?("./data/people.json")
    object = JSON.parse(File.read("./data/people.json"))
    object.each do |person|
      unless person["class"] == 'Teacher'
        student = Student.new(person["age"], person["name"], person["parent_permission"], person["classroom"])
        student.id = person["id"]
        people << student
      else
        teacher = Teacher.new(person["age"], person["name"], person["parent_permission"], person["specialization"])
        teacher.id = person["id"]
        people << teacher
      end
    end
  end

  def self.load_books(books)
    return books unless File.exists?("./data/books.json")
    object = JSON.parse(File.read("./data/books.json"))
    object.each do |book|
      book_json =  Book.new(book["title"], book["author"])
      books << book_json
    end
  end

  def save_rentals

  end

  def exit(people)
    save_people(people)
  end

end