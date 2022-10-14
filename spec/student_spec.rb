require_relative '../student'

describe Student do
    before(:each) do
        @student = Student.new(38, 'Taylor', true, 'Ruby')
    end
    
  it 'should say "¯\(ツ)/¯" when call the play_hooky method' do
    expect(@student.play_hooky).to eql "¯\(ツ)/¯"
  end
  
  it 'Should be able to create a student age' do
    expect(@student.age).to eq 38
  end

  it 'Should be able to create a student name' do
    expect(@student.name).to eq 'Taylor'
  end

  it 'Should be able to create a student parent permission' do
    expect(@student.parent_permission).to eq true
  end

  it 'Should be able to create a student classroom' do
    expect(@student.classroom).to eq 'Ruby'
  end

end