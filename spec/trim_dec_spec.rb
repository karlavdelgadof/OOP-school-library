require_relative '../trim_dec'
require_relative '../person'

describe 'Testing the trim decorator class' do
  before :each do
    @person = Person.new(25, 'Anastasia Hopps', true)
  end

  it 'Should return Vitor' do
    trimmed = TrimmerDecorator.new(@person)
    expect(trimmed.correct_name).to eql 'Anastasia '
  end
end
