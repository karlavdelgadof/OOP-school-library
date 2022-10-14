require_relative '../teacher'

describe Teacher do
    before(:each) do
        @teacher = Teacher.new(38, 'Taylor', true, 'Programming')
    end

  it 'Should be able to create a teacher age' do
    expect(@teacher.age).to eq 38
  end

  it 'Should be able to create a teacher name' do
    expect(@teacher.name).to eq 'Taylor'
  end

  it 'Should be able to create a teacher parent permission' do
    expect(@teacher.parent_permission).to eq true
  end

  it 'Should be able to create a teacher specialization' do
    expect(@teacher.specialization).to eq 'Programming'
  end

end