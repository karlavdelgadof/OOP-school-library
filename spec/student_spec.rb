require './student'

describe Student do
  context "When creating a new instance of the Student class" do
    it "The constructor method returns a Student object with provided age, name, parent permission and classroom" do
      age = 14
      name = "Agustina"
      classroom = "4"
      student = Student.new(age, name, true, classroom)

      expect(student.age).to eql age
      expect(student.name).to eql name
      expect(student.classroom).to eql classroom
      expect(student.parent_permission).to be true
    end
  end
end