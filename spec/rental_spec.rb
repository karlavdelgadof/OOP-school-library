require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  before :each do
    @book = Book.new('Atomic Habits', 'James Clear')
    @person = Person.new(30, 'Tom', true)
    @rental = Rental.new('10-14-2022', @book, @person)
  end
  it 'Should return the values provided to the constructor class' do
    expect(@rental.date).to eql '10-14-2022'
    expect(@rental.book).to eql @book
    expect(@rental.person).to eql @person
  end

  it 'Should be an object instance of the Rental class' do
    expect(@rental).to be_an_instance_of Rental
  end
end