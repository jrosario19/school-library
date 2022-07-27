require './rental'
require './book'
require './person'

describe Rental do
  it 'should have a date' do
    person = Person.new('40', 'Juan', parent_permission: true)
    rental = Rental.new('2022-07-27', Book.new('Book1', 'Author1'), person)
    expect(rental.date).to eq('2022-07-27')
  end

  it 'should have a book' do
    book = Book.new('Book1', 'Author1')
    rental = Rental.new('2022-07-27', book, Person.new('40', 'Juan', parent_permission: true))
    expect(rental.book).to eq(book)
  end

  it 'should have a person' do
    person = Person.new('40', 'Juan', parent_permission: true)
    rental = Rental.new('2022-07-27', Book.new('Book1', 'Author1'), person)
    expect(rental.person).to eq(person)
  end
end
