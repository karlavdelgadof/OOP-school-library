require_relative '../student'

describe Student do
  before(:each) do
    @student = Student.new(12, 'Agustina', false, '78')
  end

  it 'Should return the values provided to the constructor class' do
    expect(@student.age).to eql 12
    expect(@student.name).to eql 'Agustina'
    expect(@student.parent_permission).to be false
    expect(@student.classroom).to ql '78'
  end

  it 'Should return"¯\(ツ)/¯" when call the play_hooky method' do
    expect(@student.play_hooky).to eql "¯\(ツ)/¯"
  end
end
