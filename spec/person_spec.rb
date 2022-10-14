require_relative '../person'

describe Person do
  before :each do
    @person = Person.new(38, 'Taylor', parent_permission: true)
  end

  it 'should be an object instance of Person' do
    expect(@person).to be_an_instance_of Person
  end

  it 'the can_use_services? should return true' do
    permission = @person.can_use_services?
    expect(permission).to eq true
  end

  it 'the method should return Taylor' do
    expect(@person.name).to eq 'Taylor'
  end

  it 'the method getter age should return 38' do
    expect(@person.age).to eq 38
  end
end