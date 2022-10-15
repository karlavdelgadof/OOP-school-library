require_relative '../capitalize_dec'
require_relative '../person'

describe 'Testing the capitalize decorator class' do
  before :each do
    @person = Person.new(30, 'vitor', true)
  end

  it 'Should return Vitor' do
    capitalized = CapitalizeDecorator.new(@person)
    expect(capitalized.correct_name).to eql 'Vitor'
  end
end