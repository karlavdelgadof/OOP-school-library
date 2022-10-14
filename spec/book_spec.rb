require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('Zeus', 'Taylor')
  end
  it 'should be an instance of book' do
    expect(@book.title).to eq 'Zeus'
    expect(@book.author).to eq 'Taylor'
  end

  it 'should be an object instance of Book' do
    expect(@book).to be_an_instance_of Book
  end
end