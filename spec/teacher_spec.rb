require './teacher'

describe Teacher do
  context "When creating a new instance of the Teacher class" do
    it "The constructor method returns a Teacher object with provided age, name, parent permission and specialization" do
      age = 35
      name = "Emilia Bridgerton"
      specialization = "Math"
      teacher = Teacher.new(age, name, true, specialization)

      expect(teacher.age).to eql age
      expect(teacher.name).to eql name
      expect(teacher.specialization).to eql specialization
      expect(teacher.parent_permission).to be true
    end
  end
end