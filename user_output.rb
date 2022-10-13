require 'json'

class UserOutput
  def self.load_people(people)
    return people unless File.exists?("people.json")
    object = JSON.parse(File.read("people.json"))
    # parsed_json = JSON.parse(object)
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

  def save_book
  end

  def save_rentals

  end

  def exit(people)
    save_people(people)
  end

end