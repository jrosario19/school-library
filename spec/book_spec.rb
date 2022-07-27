require './store'
require './book'

describe Book do
  it 'should have a title' do
    book = Book.new('Book1', 'Author1')
    expect(book.title).to eq('Book1')
  end

  it 'should have an author' do
    book = Book.new('Book1', 'Author1')
    expect(book.author).to eq('Author1')
  end

  it 'should have a list of rentals' do
    book = Book.new('Book1', 'Author1')
    expect(book.rentals).to eq([])
  end
end