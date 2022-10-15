require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Book do
  before :each do
    @book = Book.new('1984', 'George Orwell')
  end
  it 'Should return the values provided to the constructor class' do
    expect(@book.title).to eq '1984'
    expect(@book.author).to eq 'George Orwell'
  end

  it 'Should be an object instance of the Book class' do
    expect(@book).to be_an_instance_of Book
  end

  it 'The method create_rental should return an object instance of the Rental class' do
    person = Person.new(14, 'Eloise Van Dansen', true)
    rental = @book.create_rental(person, '10-14-2022')
    expect(rental).to be_an_instance_of Rental
  end
end
