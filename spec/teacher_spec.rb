require_relative '../teacher'

describe Teacher do
    before(:each) do
        @teacher = Teacher.new(38, 'Taylor', false, 'Programming')
    end

  it 'Should return the values provided to the constructor class' do
    expect(@teacher.age).to eql 38
    expect(@teacher.name).to eql 'Taylor'
    expect(@teacher.parent_permission).to eq false
    expect(@teacher.specialization).to eq 'Programming'
  end

  it 'The method can_use_services? should return true' do
    expect(@teacher.can_use_services?).to eq true
  end
end