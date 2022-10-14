require './person'

describe Person do
  context "When creating a new instance of the Person class" do
    it "The constructor method returns a Person object with provided age, name, parent permission, and empty rentals" do
      age = 30
      name = "Lucia Dawson"
      person = Person.new(age, name, false)

      expect(person.age).to eql age
      expect(person.name).to eql name
      expect(person.rentals).to eql []
      expect(person.parent_permission).to be false
    end
  end
end
