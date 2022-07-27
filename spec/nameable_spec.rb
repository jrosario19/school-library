require './nameable'

describe Nameable do
  it 'has a :correct_name method' do
    nameable = Nameable.new
    expect(nameable.respond_to?(:correct_name)).to eq(true)
  end

  it ':correct_name method raises a NotImplementedError' do
    nameable = Nameable.new
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
