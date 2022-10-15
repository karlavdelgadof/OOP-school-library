require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Ruby')
  end

  it 'Should get label Ruby' do
    expect(@classroom.label).to eq 'Ruby'
  end

  it 'Classroom students should return an empty array' do
    expect(@classroom.students).to eq []
  end

  it 'Should be an object instance of Classroom' do
    expect(@classroom).to be_an_instance_of Classroom
  end
end
