require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  before :each do
    @person = Person.new(30, 'Lana', true)
  end

  it 'Should be an object instance of the Person class' do
    expect(@person).to be_an_instance_of Person
  end

  it 'Should return the values provided to the constructor class' do
    expect(@person.age).to eql 30
    expect(@person.name).to eql 'Lana'
  end

  it 'The method can_use_services? should return true' do
    permission = @person.can_use_services?
    expect(permission).to eql true
  end

  it 'The method can_use_services? should return false' do
    @person.age = 17
    @person.parent_permission = false
    expect(@person.can_use_services?).to eq false
  end

  it 'The method correct_name should return the name' do
    name = @person.correct_name
    expect(name).to eql 'Lana'
  end

  it 'The method create_rental should return an object instance of the Rental class' do
    book = Book.new('Alice in Wonderland', 'Lewis Caroll')
    rental = @person.create_rental('10-14-2022', book)
    expect(rental).to be_an_instance_of Rental
  end
end